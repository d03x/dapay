<?php
enum HttpResponseCode: Int
{
    case OK = 200;
    case CREATED = 201;
    case BAD_REQUEST = 400;
    case UNAUTHORIZED = 401;
    case FORBIDDEN = 403;
    case NOT_FOUND = 404;
    case UNPROCESSABLE_ENTITY = 422;

    case INTERNAL_SERVER_ERROR = 500;
}
class ResponseModel
{

    public function __construct(
        public string $status = "OK",
        public ?string $message = null,
        public mixed $data = null,
        public mixed $errors = null,
        public mixed $meta = null,
        public HttpResponseCode $code = HttpResponseCode::OK,
    ) {}
}
function response_json(array|ResponseModel $data = [], $code = HttpResponseCode::OK->value)
{
    if (ob_get_level()) ob_clean();
    http_response_code($code);
    $dataFiltered = array_filter((array)$data, function ($value) {
        return !is_null($value);
    });
    header('Content-Type: application/json; charset=utf-8');
    $json = json_encode($dataFiltered, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_PRESERVE_ZERO_FRACTION | JSON_UNESCAPED_SLASHES);
    if ($json == false) {
        http_response_code(500);
        echo json_encode(['error' => 'Internal Server Error: Encoding failed']);
    } else {
        echo $json;
    }
    exit;
}
