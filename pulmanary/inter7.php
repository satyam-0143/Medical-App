<?php
require("conn.php");
header("Content-Type: application/json");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);

    if (isset($data["P_id"]) && isset($data["eso2"])) {
        $id = $data["P_id"];
        $spo2 = $data["eso2"];

        // Update the SpO2 value in the database
        $sql = "UPDATE patient_info SET eso2='$spo2' WHERE P_id='$id'";
        if (mysqli_query($conn, $sql)) {
            $response = array('status' => 'success', 'message' => 'eso2 value updated successfully');
            echo json_encode($response);
        } else {
            $response = array('status' => 'failure', 'message' => 'Failed to update SpO2 value');
            echo json_encode($response);
        }
    } else {
        $response = array('status' => 'failure', 'message' => 'P_id or eso2 value not received in the request');
        echo json_encode($response);
    }
} else {
    $response = array('status' => 'failure', 'message' => 'Invalid request method');
    echo json_encode($response);
}
?>