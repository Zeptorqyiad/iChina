<?php

namespace App\Extensions\Form\Component;

use PHPMailer\PHPMailer\PHPMailer;
use Simflex\Core\Core;

class MailAssist
{
    protected $address;
    protected $additionalAddress;
    protected $subject;
    protected $template;
    protected $data;
    protected $body;
    protected $attachment;
    protected $attachmentName;
    public $ErrorInfo;

    // todo: do it properly!
    public static string $tplPath = __DIR__;

    public function __construct(string $to, string $subject)
    {
        $this->address = $to;
        $this->subject = $subject;
    }

    public function tpl(string $template, array $data = []): self
    {
        $this->template = $template;
        $this->data = $data;
        return $this;
    }

    public function content(string $data): self
    {
        $this->body = $data;
        return $this;
    }

    public function alsoTo(string $param): self
    {
        $this->additionalAddress = Core::siteParam($param);
        return $this;
    }

    public function file(string $path, string $name): self
    {
        $this->attachment = $path;
        $this->attachmentName = $name;
        return $this;
    }

    public function send()
    {
        $mailHost = env('MAIL_HOST');
        $mailUser = env('MAIL_USERNAME');
        $mailPass = env('MAIL_PASSWORD');
        $mailSecurity = env('MAIL_SECURITY');

        if (!$mailHost || !$mailUser || !$mailPass) {
            throw new \RuntimeException('SMTP не настроен: заполните MAIL_HOST, MAIL_USERNAME, MAIL_PASSWORD в .env');
        }

        $mail = new PHPMailer();
        $mail->isSMTP();
        $mail->SMTPAuth = true;
        $mail->SMTPSecure = $mailSecurity;
        $mail->Host = $mailHost;
        $mail->Port = 465;
        $mail->Username = $mailUser;
        $mail->Password = $mailPass;
        $mail->FromName = trim(strip_tags((string)Core::siteParam('site_name')));
        $mail->From = $mailUser;
        $mail->CharSet = PHPMailer::CHARSET_UTF8;

        $mail->SMTPOptions = [
            'ssl' => [
                'verify_peer' => false,
                'verify_peer_name' => false,
                'allow_self_signed' => true,
            ]
        ];

        $replyTo = trim((string)Core::siteParam('form_email'));
        if ($replyTo !== '' && filter_var($replyTo, FILTER_VALIDATE_EMAIL)) {
            $mail->addReplyTo($replyTo);
        }

        $recipients = $this->normalizeEmails((string)$this->address);
        if (!$recipients) {
            $this->ErrorInfo = 'Нет валидных email получателей. form_email=' . (string)$this->address;
            return false;
        }

        foreach ($recipients as $recipient) {
            $mail->addAddress($recipient);
        }

        if ($this->additionalAddress) {
            foreach ($this->normalizeEmails((string)$this->additionalAddress) as $recipient) {
                $mail->addAddress($recipient);
            }
        }

        if ($this->attachment) {
            $mail->addAttachment($this->attachment, $this->attachmentName);
        }

        $mail->isHTML();
        if (!$this->body) {
            $this->body = $this->runTemplate();
        }

        $mail->Subject = $this->subject;
        $mail->Body = $this->body;
        $result = $mail->send();
        $this->ErrorInfo = $mail->ErrorInfo;
        return $result;
    }

    protected function runTemplate()
    {
        ob_start();
        extract($this->data ?? []);
        include static::$tplPath . '/tpl/mail/' . $this->template;
        return ob_get_clean();
    }

    protected function normalizeEmails(string $raw): array
    {
        $parts = preg_split('/[;,]+/', strip_tags($raw)) ?: [];
        $emails = [];
        foreach ($parts as $part) {
            $email = trim($part);
            if ($email !== '' && filter_var($email, FILTER_VALIDATE_EMAIL)) {
                $emails[] = $email;
            }
        }
        return array_values(array_unique($emails));
    }
}
