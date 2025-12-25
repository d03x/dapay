<?php
enum Inquiry: string
{
    case CEK_HARGA = "HARGA";
    case CEK_SALDO = "S";
}
enum HargaCode: string
{
    case PLN = "PLN";
    case PULSA = "PULSA";
    case GAME = "GAME";
}
class PortalPulsaApi
{
    const REST_API_URL = "https://portalpulsa.com/api/connect/";
    private string $user_id = "P248678";
    private string $key  = "363cd7791535f0453ea75662245d7f05";
    private string $secret_key = "a580ea3ac22c1c96c92c3ba390bc741e4afc0254fd533cc9611d1bde0d3145bf";
    public static $instance = null;

    public static function instance()
    {
        if (self::$instance === null) {
            self::$instance = new PortalPulsaApi;
        }
        return self::$instance;
    }
    public function request($data = [])
    {
        $header = [
            'portal-userid: ' . $this->user_id,
            'portal-key: ' . $this->key,
            'portal-secret: ' . $this->secret_key,
        ];
        // 3. Inisialisasi cURL
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, PortalPulsaApi::REST_API_URL);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

        // Timeout settings (Opsional tapi disarankan)
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);

        // 4. Eksekusi
        $result = curl_exec($ch);
        $error  = curl_error($ch);
        $errno  = curl_errno($ch);


        if ($error) {
            throw new Exception("cURL Error ({$errno}): {$error}");
        }

        // 6. Decode JSON response menjadi Array
        $response = json_decode($result, true);

        // Cek jika JSON tidak valid
        if (json_last_error() !== JSON_ERROR_NONE) {
            throw new Exception("Invalid JSON Response: " . $result);
        }

        return $response;
    }
    public function getSaldo()
    {
        return response_json($this->request(array(
            'inquiry' => Inquiry::CEK_HARGA->value,
            'code' => "PLN",
        )));
    }
}
