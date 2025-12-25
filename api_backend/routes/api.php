<?php

use Illuminate\Support\Facades\Route;

Route::post('/auth/login', function () {
    return [
        'id' => "id",
        'name' => "name",
        'email' => "email",
        'token' => "token",
        'refresh_token' => "refreshToken",
        'post' => $_POST,
    ];
});
