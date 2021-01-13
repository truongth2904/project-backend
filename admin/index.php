<?php
require_once "app.php";
$product = new Product();
$products = $product->getAllProducts();

$url = $_SERVER['PHP_SELF'];
$pagination = new Pagination();
$productss = $product->getAllProductsPagination($pagination::$page, $pagination::$perPage);

if (isset($_GET['delete-id'])) {
    $id = $_GET['delete-id'];
    $check = $product->deleteProduct($id);
    if ($check) header("Refresh:0; url=index.php");
}

if (isset($_GET['key'])) {
    $key = $_GET['key'];
    $products = $product->getProductsSearch($key);
    $productss = $product->getProductsWithKeywordPagination($key, $pagination::$page, $pagination::$perPage);
}
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
            <h1>Manage Products</h1>
        </div>
        <div class="container-fluid">
            <hr>
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box">
                        <div class="widget-title"> <span class="icon"><a href="form.php"> <i class="icon-plus"></i>
                                </a></span>
                            <h5>Products</h5>
                        </div>
                        <div class="widget-content nopadding">
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Name</th>
                                        <th>Manufactures</th>
                                        <th>Product type</th>
                                        <th>Description</th>
                                        <th>Price (VND)</th>
                                        <th>Feature</th>
                                        <th>Created at</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    foreach ($productss as $pro) {
                                    ?>
                                        <tr class="">
                                            <td width="250"><img src="../images/<?php echo $pro['pro_image']; ?>" />
                                            </td>
                                            <td><?php echo $pro['name'] ?></td>
                                            <td><?php echo $pro['manu_name'] ?></td>
                                            <td><?php echo $pro['type_name'] ?></td>
                                            <td><?php echo substr($pro['description'], 0, 100)  ?></td>
                                            <td><?php echo number_format($pro['price']);  ?></td>
                                            <td><?php echo $pro['feature'] ?></td>
                                            <td><?php echo $pro['created_at'] ?></td>
                                            <td>
                                                <a href="edit-product.php?id=<?php echo $pro['id'] ?>" class="btn btn-success btn-mini">Edit</a>
                                                <a href="?delete-id=<?php echo $pro['id'] ?>" class="btn btn-danger btn-mini">Delete</a>
                                            </td>
                                        </tr>
                                    <?php    } ?>
                                </tbody>
                            </table>
                            <div class="row" style="margin-left: 18px;">
                                <ul class="pagination">
                                    <?php echo $pagination->paginate("$url?", count($products)); ?>
                                </ul>
                            </div>
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