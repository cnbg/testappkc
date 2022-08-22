<?php

if (!function_exists('has_access')) {
    function has_access($session_key): bool
    {
        $api_key = $_GET['api_key'] ?? '';

        if(empty($api_key) || empty($session_key) || $session_key !== $api_key) {
            return false;
        }

        return true;
    }
}
