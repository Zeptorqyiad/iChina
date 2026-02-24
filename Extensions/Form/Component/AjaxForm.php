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
            'email' => $email,
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

        DB::query(
            'insert into callback_email (email, is_subscribed) select ?, 1 where not exists(select 1 from callback_email where email = ?)',
            [$email, $email]
        );

        exit(json_encode(['success' => $this->sendTelegram() || $this->sendMail(), 'errors' => $this->errors]));
    }

    protected function sendMail()
    {
        try {
            $m = new MailAssist(Core::siteParam('form_email'), 'Новая заявка с сайта');

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
        $text = "<b>НОВАЯ ЗАЯВКА</b>\n\n" .
            "<b>Имя:</b> " . htmlspecialchars($this->data['name']) . "\n" .
            "<b>E-mail:</b> " . htmlspecialchars($this->data['email']) . "\n" .
            "<b>Телефон:</b> " . htmlspecialchars($this->data['phone']) . "\n" .
            "<b>Комментарий:</b> " . htmlspecialchars($this->data['textarea']);

        $ch = curl_init();
        curl_setopt_array($ch, [
            CURLOPT_URL => 'https://api.telegram.org/bot' . Core::siteParam('form_tg_token') . '/sendMessage',
            CURLOPT_POST => true,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_POSTFIELDS => [
                'chat_id' => Core::siteParam('form_tg_chat_id'),
                'text' => $text,
                'parse_mode' => 'HTML'
            ]
        ]);

        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        if ($httpCode !== 200 || $response === false) {
            $this->errors[] = 'Telegram sending failed: HTTP ' . $httpCode;
            return false;
        }

        $result = json_decode($response, true);
        if (!$result['ok']) {
            $this->errors[] = 'Telegram API error: ' . ($result['description'] ?? 'Unknown');
            return false;
        }

        return true;
    }
}
