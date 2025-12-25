<?php
$type = $_GET['type'] ?? null;

function login()
{
    response_json([
        'id' => "id",
        'name' => "name",
        'email' => "email",
        'token' => "token",
        'refresh_token' => "refreshToken",
        'post' => $_POST,
    ]);
}
match ($type) {
    'login' => login(),
    null => response_json([
        'error' => "Ada Kesalahan"
    ], code: 404)
};
