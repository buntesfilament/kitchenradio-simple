<?php
header('Content-Type: application/json');
$response = [
    "rc" => $rc,
    "state" => $state,
    "output" => implode(" ", $output)
];
echo json_encode($response);
?>

