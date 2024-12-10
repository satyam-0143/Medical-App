<?php
require_once('conn.php'); // Ensure your database connection is included

// Prepare the SQL query
$query = "SELECT D_id, D_name,D_dep FROM d_profile";
$stmt = $conn->prepare($query);

// Execute the statement
$stmt->execute();

// Store the result
$result = $stmt->get_result(); // Get the result set from the prepared statement

// Initialize an array to hold the doctors' data
$doctors = [];

// Fetch all results into the array
while ($row = $result->fetch_assoc()) {
    $doctors[] = $row; // Append each row to the doctors array
}

// Return the results as JSON
header('Content-Type: application/json');
echo json_encode($doctors);

// Close the statement and connection
$stmt->close();
$conn->close();
?>
