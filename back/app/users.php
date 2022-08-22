<?php
require_once __DIR__ . '/../bootstrap.php';
require_once 'functions/has_access.php';

use App\DB;

$session_key = $_SESSION['api_key'] ?? '';

if(!has_access($session_key)) {
    try {
        $perPage = (int)$_ENV['PAGINATION'];

        $db = DB::getInstance()->getConnection();

        $total = $db->query("SELECT COUNT(`id`) FROM `students`")->fetchColumn() ?? 0;

        $page = (int)($_GET['page'] ?? 1) - 1;
        $start = $page * $perPage;

        $query = $db->query(
            "SELECT s.`id`, s.`status`, s.`username`, s.`name`, g.`name` as `group` 
FROM `students` s INNER JOIN `groups` g on s.`group_id` = g.`id` ORDER BY s.`id` ASC LIMIT $start, $perPage"
        );
        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        $json = [
            'perPage' => $perPage,
            'total'   => $total,
            'data'    => $result,
        ];
    } catch (Exception $e) {
        $json = [
            'message' => $e->getMessage(),
            'code'    => $e->getCode(),
        ];
    }

    $db = null;

    echo json_encode($json);
} else {
    http_response_code(401);
}
