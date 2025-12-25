<?php require 'core/global_function.php';
$endpoint  = $_GET['endpoint'] ?? null;
require "core/providers/portal_pulsa_api.php";

if (!empty($endpoint)) {
    require match ($endpoint) {
        'auth' => 'api_handler/api_auth.php',
    };
}
