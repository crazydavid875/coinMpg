<?php



$conn_IP = "db";

$conn_userName = "coursemap";

$conn_passwd = "coursemap";

$conn_db = "coursemap";



$sql = new mysqli($conn_IP,$conn_userName,$conn_passwd,$conn_db);

if (mysqli_connect_errno()) {

    printf("Connect failed: %s\n", mysqli_connect_error());

    echo mysqli_connect_error();

    exit();

}

