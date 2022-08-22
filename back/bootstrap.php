<?php
session_start();

require 'vendor/autoload.php';

header("Access-Control-Allow-Origin: http://localhost");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: GET,POST,PUT,PATCH,DELETE,OPTIONS");
header('Content-type:application/json;charset=utf-8');

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();
