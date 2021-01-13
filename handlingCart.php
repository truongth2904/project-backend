<?php
require "app.php";
session_start();
$cartModel = new Cart();
// Bấm vào xóa sản phẩm:
if (isset($_GET['delete-id'])) {
    $id = $_GET['delete-id'];
    $check = $cartModel->deleteCartOnId($id, $_SESSION['username']);
    if ($check) header("Location: cart.php");
}
// Thêm sản phẩm tăng lên:
if (isset($_GET['id'])) {
    $check = false;
    $carts = $cartModel->getAllProductOnUsernameInCard($_SESSION['username']);
    foreach ($carts as $cart) {
        if ($cart['id_product'] == $_GET['id'] && $cart['username'] == $_SESSION['username'] && $cart['status'] == 1) {
            $cart['amount_product'] += 1;
            $cartModel->updateCartOnId($_GET['id'], $_SESSION['username'], $cart['amount_product']);
            $check = true;
        }
    }
    if (!$check) {
        $cartModel->insertInCartOnUser($_GET['id'], $_SESSION['username'], 1);
    }
    header("Location: cart.php");
}
// Bấm trừ sản phẩm 
if (isset($_GET['id_giam'])) {
    $carts = $cartModel->getAllProductOnUsernameInCard($_SESSION['username']);
    foreach ($carts as $cart) {
        if ($cart['id_product'] == $_GET['id_giam'] && $cart['username'] == $_SESSION['username']) {
            if ($cart['amount_product'] <= 1) {
                $cartModel->deleteCartOnId($cart['id_product'], $_SESSION['username']);
            } else {
                $cartModel->updateCartOnId($_GET['id_giam'], $_SESSION['username'], $cart['amount_product'] - 1);
            }
        }
    }
    header("Location: cart.php");
}
// Bấm cộng sản phẩm
if (isset($_GET['id_tang'])) {
    $carts = $cartModel->getAllProductOnUsernameInCard($_SESSION['username']);
    foreach ($carts as $cart) {
        if ($cart['id_product'] == $_GET['id_tang'] && $cart['username'] == $_SESSION['username']) {
            $cartModel->updateCartOnId($_GET['id_tang'], $_SESSION['username'], $cart['amount_product'] + 1);
        }
    }
    header("Location: cart.php");
}

// Đăng kí sản phẩm:
if (isset($_GET['username'])) {
    $carteds = $cartModel->getAllProductOrderOnUsername($_SESSION['username']); // đã đăng kí
    $carts = $cartModel->getAllProductOnUsernameInCard($_SESSION['username']); // chưa đăng kí
    foreach ($carteds as $carted) {
        foreach ($carts as $cart) {
            if ($carted['id_product'] == $cart['id_product'] && $cart['username'] == $_SESSION['username']) {
                $total = $carted['amount_product'] + $cart['amount_product'];
                $cartModel->updateCartedOnId($carted['id_product'], $_SESSION['username'], $total);
                $cartModel->deleteCartOnId($cart['id_product'], $_SESSION['username']);
            }
        }
    }
    $cartModel->registrationCartOnId($_SESSION['username']);
    header("Location: cart.php");
}
