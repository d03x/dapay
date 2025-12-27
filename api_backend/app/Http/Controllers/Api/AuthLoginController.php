<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use GuzzleHttp\Psr7\Response;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Symfony\Component\HttpFoundation\Response as HttpFoundationResponse;

class AuthLoginController extends Controller
{
    public function login(Request $request)
    {
        $user = Validator::make($request->only(['email', 'password']), [
            'email' => ['email', 'required'],
            'password' => ["required"]
        ]);
        if ($user->fails()) {
            return response()->json([
                'message' => "Error",
                'errors' => $user->errors(),
            ], HttpFoundationResponse::HTTP_UNPROCESSABLE_ENTITY);
        }
        if (!$token = Auth::attempt($user->validated())) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }
        return $this->respondWithToken($token);
    }

    public function respondWithToken(string $token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => Auth::factory()->getTTL() * 60
        ]);
    }
}
