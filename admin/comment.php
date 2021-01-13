<?php
require_once "app.php";

$CommentModel = new Comment();
$EvaluteModel = new Evalute();
$productModel = new Product();

$comments = $CommentModel->getAllComment();
$evalutes = $EvaluteModel->getAllEvalute();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Mobile Admin</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="../images/logo.png" type="image/icon type">
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="css/uniform.css" />
    <link rel="stylesheet" href="css/select2.css" />
    <link rel="stylesheet" href="css/matrix-style.css" />
    <link rel="stylesheet" href="css/matrix-media.css" />
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
    <style type="text/css">
        ul.pagination {
            list-style: none;
            float: right;
        }

        ul.pagination li.active {
            font-weight: bold
        }

        ul.pagination li {
            display: flex;
            padding: 10px
        }
    </style>
</head>

<body>
    <!--Header-part-->
    <div id="header">
        <h1><a href="http://localhost:8888/dienthoai/"><img src="../images/logo.png" alt=""></a></h1>
    </div>
    <!--close-Header-part-->
    <!--top-Header-menu-->
    <?php require "header.php"; ?>
    <!--start-top-serch-->
    <?php require "./search.php"; ?>
    <!--close-top-serch-->
    <!--sidebar-menu-->
    <div id="sidebar"> <a href="#" class="visible-phone"><i class="icon icon-th"></i>Tables</a>
        <ul>
            <li><a href="index.php"><i class="icon icon-home"></i> <span>Dashboard</span></a> </li>
            <li> <a href="manufactures.php"><i class="icon icon-th-list"></i> <span>Manufactures</span></a></li>
            <li> <a href="protypes.php"><i class="icon icon-th-list"></i> <span>Product type</span></a></li>
            <li> <a href="users.php"><i class="icon icon-th-list"></i> <span>Users</span></a></li>
            <li> <a href="comment.php"><i class="icon icon-th-list"></i> <span>Comment</span></a></li>
        </ul>
    </div><!-- BEGIN CONTENT -->
    <div id="content">
        <div id="content-header">
            <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom current"><i class="icon-home"></i> Home</a></div>
            <h1>Comment & Evalute</h1>
        </div>
        <div class="container-fluid">
            <hr>
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box">
                        <div class="widget-title"> <span class="icon">
                            <h5></h5>
                        </div>
                        <div class="widget-content nopadding">
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th> Id</th>
                                        <th>Image</th>
                                        <th>Content</th>
                                        <th>Star</th>
                                        <th>User</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($comments as $comment) {
                                        $product = $productModel->getProductsFromID($comment['id_product']);
                                        $user = $userModel->getUserFromUsername($comment['username']);
                                        $evalute = $EvaluteModel->getInFo($comment['id_product'],$comment['username']);
                                    ?>
                                        <tr>
                                            <td><?php echo $comment['id_product']; ?></td>
                                            <td width="100px"><img src="../images/<?php echo $product->pro_image; ?>" />
                                            </td>
                                            <td><?php echo $comment['content']; ?></td>
                                            <td><?php echo $evalute->point; ?></td>
                                            <td><?php echo $user->fullname; ?></td>
                                        </tr>
                                    <?php } ?>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- END CONTENT -->
    <!--Footer-part-->
    <div class="row-fluid">
        <div id="footer" class="span12"> 2017 &copy; TDC - Lập trình web 1</div>
    </div>
    <!--end-Footer-part-->
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.ui.custom.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.uniform.js"></script>
    <script src="js/select2.min.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/matrix.js"></script>
    <script src="js/matrix.tables.js"></script>
</body>

</html>