<?php
// Include your database connection code
require_once('conn.php');

// Check if the request is a POST request
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Read the raw POST data and decode the JSON
    $input = json_decode(file_get_contents('php://input'), true);

    // Check if all required parameters are present
    if (isset($input['D_id']) && isset($input['D_phno']) && isset($input['new_password'])) {
        $P_id = $input['D_id'];
        $P_phno = $input['D_phno'];
        $new_password = $input['new_password'];

        // Prepare a SQL statement to verify P_id and P_phno
        $select_stmt = $conn->prepare("SELECT * FROM d_profile WHERE D_id = ? AND D_phno = ?");
        if ($select_stmt === false) {
            $response = array('status' => 'error', 'message' => 'Failed to prepare select statement.');
            echo json_encode($response);
            exit;
        }

        // Bind parameters and execute the select query
        $select_stmt->bind_param("ss", $P_id, $P_phno);
        $select_stmt->execute();
        $select_result = $select_stmt->get_result();

        if ($select_result->num_rows > 0) {
            // Record found, proceed to update password
            $update_stmt = $conn->prepare("UPDATE d_profile SET password = ? WHERE D_id = ? AND D_phno = ?");
            if ($update_stmt === false) {
                $response = array('status' => 'error', 'message' => 'Failed to prepare update statement.');
                echo json_encode($response);
                exit;
            }

            // Bind the new password and execute the update query
            $update_stmt->bind_param("sss", $new_password, $P_id, $P_phno);
            if ($update_stmt->execute()) {
                // Password updated successfully
                $response = array('status' => 'success', 'message' => 'Password updated successfully.');
            } else {
                // Error while updating password
                $response = array('status' => 'error', 'message' => 'Failed to update password.');
            }

            // Close the update statement
            $update_stmt->close();
        } else {
            // No matching P_id and P_phno found
            $response = array('status' => 'error', 'message' => 'Invalid P_id or P_phno.');
        }

        // Close the select statement
        $select_stmt->close();
    } else {
        // Handle missing parameters in the JSON input
        $response = array('status' => 'error', 'message' => 'Missing P_id, P_phno, or new_password parameter.');
    }

    // Send the response as JSON
    echo json_encode($response);
} else {
    // Handle non-POST requests
    $response = array('status' => 'error', 'message' => 'Invalid request method.');
    echo json_encode($response);
}

// Close the database connection
$conn->close();
?>
