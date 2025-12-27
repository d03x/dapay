<?php

use App\Http\Controllers\Api\AuthLoginController;
use Illuminate\Support\Facades\Route;

Route::post('/auth/login', [AuthLoginController::class, 'login']);
