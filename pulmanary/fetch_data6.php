<?php
require("conn.php");
header("Content-Type: application/json");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);

    if (isset($data["P_id"])) {
        $id = $data["P_id"];

        // Perform the query and handle errors
        $sql = mysqli_query($conn, "SELECT apr, aprfvc, aprfev1, aprfef, bpr, bprfvc, bprfev1, bprfef FROM patient_info WHERE P_id='$id'");

        if (!$sql) {
            // Query failed, return error
            echo json_encode(array('status' => 'failure', 'message' => 'Query Error: ' . mysqli_error($conn)));
            exit;
        }

        $row = mysqli_fetch_assoc($sql);

        if ($row) {
            echo json_encode(array('status' => 'success', 'data' => $row));
        } else {
            echo json_encode(array('status' => 'failure', 'message' => 'No data found for the given ID'));
        }
    } else {
        echo json_encode(array('status' => 'failure', 'message' => 'ID not provided'));
    }
} else {
    echo json_encode(array('status' => 'failure', 'message' => 'Invalid request method'));
}
?>
