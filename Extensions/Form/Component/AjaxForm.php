<?php

namespace App\Extensions\Form\Component;

use Simflex\Core\ComponentBase;
use Simflex\Core\Core;
use Simflex\Core\DB;
use Simflex\Core\Time;

class AjaxForm extends ComponentBase
{
    protected $errors = [];
    protected $data = [];

    protected function content()
    {
        header('Content-Type: application/json; charset=utf-8');

        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            exit(json_encode(['success' => false, 'errors' => ['Invalid request method.']], JSON_THROW_ON_ERROR));
        }

        $name = $_REQUEST['name'] ?? '';
        $phone = $_REQUEST['phone'] ?? '';
        $email = strtolower($_REQUEST['email'] ?? '');
        $textarea = $_REQUEST['textarea'] ?? '';

        $this->data = compact('name', 'email', 'phone', 'textarea');

        if (empty($phone)) {
            $this->errors[] = 'Не заполнены обязательные поля';
            exit(json_encode(['success' => false, 'errors' => $this->errors, JSON_THROW_ON_ERROR]));
        }

        $message = json_encode([
            'email' => $textarea,
        ], JSON_UNESCAPED_UNICODE);

        $last = DB::result('select callback_id, name, phone, message from callback order by callback_id desc limit 1');
        if ($last && $last['name'] === $name && $last['phone'] === $phone && $last['message'] === $message) {
            $this->data['id'] = $last['callback_id'];
            exit(json_encode(['success' => true, 'errors' => []]));
        }

        DB::query(
            'insert into callback (name, phone, message) values (?, ?, ?)',
            [$name, $phone, $message]
        );

        $this->data['id'] = DB::insertId();

        exit(json_encode(['success' => $this->sendTelegram() || $this->sendMail(), 'errors' => $this->errors]));
    }

    protected function sendMail()
    {
        try {
            $formEmail = Core::siteParam('form_email');
            if (!$formEmail) {
                $this->errors[] = 'Почта не настроена: заполните параметр form_email';
                return false;
            }

            $m = new MailAssist($formEmail, 'Новая заявка с сайта');

            $html = <<<HTML
<p><b>Имя: </b> {$this->data['name']}</p>
<p><b>Телефон: </b> {$this->data['phone']}</p>
<p><b>E-mail: </b> {$this->data['email']}</p>
<p><b>Комментарий: </b> {$this->data['textarea']}</p>
HTML;

            $m->content($html);

            if (!$m->send()) {
                $this->errors[] = 'Почта не отправлена: ' . ($m->ErrorInfo ?: 'Неизвестная ошибка');
                return false;
            }
            return true;
        } catch (\Exception $e) {
            $this->errors[] = 'Ошибка почты: ' . $e->getMessage();
            return false;
        }
    }

    protected function sendTelegram()
    {
        $token = Core::siteParam('form_tg_token');
        $chatId = Core::siteParam('form_tg_chat_id');

        $token  = strip_tags($token);
        $chatId = strip_tags($chatId);

        $token  = trim($token);
        $chatId = trim($chatId);

        if (empty($token) || empty($chatId)) {
            $this->errors[] = 'Telegram token or chat_id not set after cleaning';
            return false;
        }

        error_log("Cleaned TG token: '$token', chat_id: '$chatId'");

        $text = "<b>НОВАЯ ЗАЯВКА</b>\n\n" .
            "<b>Имя:</b> " . htmlspecialchars($this->data['name']) . "\n" .
            "<b>E-mail:</b> " . htmlspecialchars($this->data['email']) . "\n" .
            "<b>Телефон:</b> " . htmlspecialchars($this->data['phone']) . "\n" .
            "<b>Комментарий:</b> " . htmlspecialchars($this->data['textarea']);

        $ch = curl_init();
        curl_setopt_array($ch, [
            CURLOPT_URL => 'https://api.telegram.org/bot' . $token . '/sendMessage',
            CURLOPT_POST => true,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_HTTPHEADER => ['Content-Type: application/x-www-form-urlencoded'],
            CURLOPT_POSTFIELDS => http_build_query([
                'chat_id'     => $chatId,
                'text'        => $text,
                'parse_mode'  => 'HTML'
            ]),
            CURLOPT_TIMEOUT => 10,
        ]);

        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        if ($httpCode !== 200 || $response === false) {
            $this->errors[] = 'Telegram sending failed: HTTP ' . $httpCode;
            error_log("TG fail: HTTP $httpCode, response: " . $response);
            return false;
        }

        $result = json_decode($response, true);
        if (!$result['ok']) {
            $this->errors[] = 'Telegram API error: ' . ($result['description'] ?? 'Unknown');
            error_log("TG API error: " . json_encode($result));
            return false;
        }

        return true;
    }
}
