<?php
require "app.php";
session_start();
$userModel = new User();
$adminModel = new Admin();
//var_dump(password_hash("123", PASSWORD_DEFAULT));
if (isset($_SESSION['username'])) {
	header("location:index.php");
} else {
	if (isset($_POST['username'])) {
		$user = $userModel->getUserFromUsername($_POST['username']);
		//var_dump($user);
		if ($user != null) {
			if (password_verify($_POST['pass'], $user->password)) {
				if ($user->status == 0) {
					echo "<script> alert('Tai khoan da bi xoa') </script>";
				} else {
					$_SESSION['username'] = $_POST['username'];
					header("Location: index.php");
				}
			} else {
				$mess = "Tài khoản hoặc mật khẩu không đúng !";
			}
		} else {
			header("Location: login.php");
		}
	}
}


?>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Login V1</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<!--===============================================================================================-->
</head>

<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="admin/images/images.png" alt="IMG">
				</div>

				<form class="login100-form validate-form" method="post">
					<span class="login100-form-title">
						Member Login
					</span>
					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" name="username" placeholder="Username" required>

					</div>
					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input class="input100" type="password" name="pass" placeholder="Password" required>

					</div>
					<div class="container-login100-form-btn">
						<button class="login100-form-btn" type="submit">Login</button>
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="createAccount.php">
							Create your Account
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/tilt/tilt.jquery.min.js"></script>
	<script>
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
	<!--===============================================================================================-->
	<script src="js/main_login.js"></script>

</body>

</html>