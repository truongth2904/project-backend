<?php
session_start();
require_once "../app.php";
$userModel = new User();

if (!isset($_SESSION['username'])) {
    header("location: ../login.php");
} else {
    $checkUser = $userModel->getUserFromUsername($_SESSION['username']);
    if ($checkUser->role == 0) {
        unset($_SESSION['username']);
        header("location: ../login.php");
    }
}
