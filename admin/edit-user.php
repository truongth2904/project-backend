<?php
require "app.php";
$userModel = new User();
if (isset($_GET['username'])) {
    $_SESSION['user'] = $_GET['username'];
    $user = $userModel->getUserFromUsername($_GET['username']);
}
if (isset($_GET['fullname'])) {
    $username = $_SESSION['user'];
    $fullname = $_GET['fullname'];
    $email = $_GET['email'];
    $birthday = $_GET['birthday'];
    $gender = $_GET['gender'];
    $phone = $_GET['phone'];

    $userModel->update($fullname, $email, $birthday, $gender, $phone, $username);
    unset($_SESSION['user']);
    header("location: users.php");
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">
    <!-- Title Page-->
    <title>Au Register Forms by Colorlib</title>
    <!-- Icons font CSS-->
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/mainRegister.css" rel="stylesheet" media="all">
</head>
<style>
    form {
        text-align: center;
    }

    .title {
        text-align: center;
    }

    .input--style-3 {
        padding: 10px;
        margin: 10px;
    }
</style>

<body>
    <div class="page-wrapper bg-gra-01 p-t-180 p-b-100 font-poppins">
        <div class="wrapper wrapper--w780">
            <div class="card card-3">
                <div class="card-heading">
                </div>
                <div class="card-body">
                    <h2 class="title">Edit Info User</h2>
                    <form action="" method="GET">
                        <div class="input-group">
                            <input class="input--style-3" value="<?php echo $user->username ?>" type="text" placeholder="Username" name="username" required disabled>
                        </div>
                        <div class="input-group">
                            <input class="input--style-3" value="<?php echo $user->fullname ?>" type="text" placeholder="Fullname" name="fullname" required>
                        </div>
                        <div class="input-group">
                            <input class="input--style-3" value="<?php echo $user->birthdate ?>" type="text" placeholder="Birthdate" name="birthday" required>
                        </div>
                        <div class="input-group">
                            <input class="input--style-3" value="<?php echo $user->gender ?>" type="text" placeholder="Gender" name="gender" required>
                        </div>
                        <div class="input-group">
                            <input class="input--style-3" value="<?php echo $user->email ?>" type="email" placeholder="Email" name="email" required>
                        </div>
                        <div class="input-group">
                            <input class="input--style-3" value="<?php echo $user->phone ?>" type="text" placeholder="Phone" name="phone" required>
                        </div>
                        <div class="p-t-10">
                            <button class="btn btn--pill btn--green" type="submit">Change</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global.js"></script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->