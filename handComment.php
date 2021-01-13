<?php
require "app.php";
session_start();

$commentModel = new Comment();
$evaluteModel = new Evalute();

// kiểm tra và chèn comment của user vào
if (isset($_SESSION['id']) && isset($_GET['comment'])) {
    $commentModel->insertCommentOnID($_SESSION['id'], $_GET['comment'], $_SESSION['username']);
    $evaluteModel->insertEvalute($_SESSION['id'], $_GET['evalute'], $_SESSION['username']);
    header("Location: product-details.php?id=$_SESSION[id]");
}
