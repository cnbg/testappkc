<?php

require_once __DIR__ . '/../bootstrap.php';

use App\DB;

$api_key = $_GET['api_key'] ?? '';
$session_key = $_SESSION['api_key'] ?? '';

if($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    if(!empty($api_key) && $api_key === $session_key) {
        try {
            $db = DB::getInstance()->getConnection();

            $statement = $db->prepare("UPDATE api_users SET `api_key` = NULL WHERE `api_key` = :api_key");

            $statement->execute([
                ':api_key' => $api_key,
            ]);

            echo json_encode(true);
        } catch (Exception $e) {
            $json = [
                'message' => $e->getMessage(),
                'code'    => $e->getCode(),
            ];
            echo json_encode($json);
        }

        $db = null;
    }

    echo json_encode(true);

} else if($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        $db = DB::getInstance()->getConnection();

        $statement = $db->prepare("SELECT `username`, `password` FROM api_users WHERE `username` = :username");

        $statement->execute([
            ':username' => $_POST['username'],
        ]);

        $row = $statement->fetch(PDO::FETCH_ASSOC);

        if($row !== false) {
            $hash_pass = $row['password'] ?? '';

            if(password_verify($_POST['password'], $hash_pass)) {
                $new_api_key = uniqid(md5($row['username']) . '-', true);
                $_SESSION['api_key'] = $new_api_key;

                if(isset($_POST['remember'])) {

                    $statement = $db->prepare("UPDATE api_users SET `api_key` = :api_key WHERE `username` = :username");

                    $statement->execute([
                        ':api_key' => $new_api_key,
                        ':username' => $_POST['username'],
                    ]);
                }

                $row['api_key'] = $new_api_key;

                echo json_encode($row, JSON_THROW_ON_ERROR);
            } else {
                throw new Exception('Username or password is incorrect');
            }
        } else {
            throw new Exception('Username or password is incorrect');
        }
    } catch (Exception $e) {
        $json = [
            'message' => $e->getMessage(),
            'code'    => $e->getCode(),
        ];
        echo json_encode($json);
    }

    $db = null;
}
