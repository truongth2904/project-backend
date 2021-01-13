<?php
require "app.php";
$productsModel = new Product;
$ManuFacturesModel = new ManuFactures();
$protypeModel = new Protypes();

$manufactures = $ManuFacturesModel->getAllManuFactures();
$protypes = $protypeModel->getAllProtypes();
$product = $productsModel->getProductsFromID($_GET['id']);
$manu1 = $ManuFacturesModel->getManuID($product->manu_id);
$type1 = $protypeModel->getTypeID($product->type_id);

$target_dir = "../images/";

if (isset($_POST["name"]) && isset($_FILES["fileUpload"]["name"])) {
    $nameFile = strtotime("now") . $_FILES["fileUpload"]["name"];
    $target_file = $target_dir . basename($nameFile);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

    if ($_FILES["fileUpload"]["size"] > 500000) {
        $message = "File quá lớn, vui lòng sử dụng file nhẹ hơn!";
        $uploadOk = 0;
    }
    if (
        $imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
        && $imageFileType != "gif"
    ) {
        $nameFile = $product->pro_image;
    }

    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
        echo "<script type= 'text/javascript'>alert('$message');</script>";
        // if everything is ok, try to upload file
    } else move_uploaded_file($_FILES["fileUpload"]["tmp_name"], $target_file);

    if ($uploadOk == 1) {
        $name = $_POST['name'];
        $manu = $_POST['manu_id'];
        $type = $_POST['type_id'];
        $desription = $_POST['description'];
        $price = $_POST['price'];
        $feature = $_POST['feature'];
        $pro_image = $nameFile;
        $check = $productsModel->updateProduct($name, $manu, $type, $price, $pro_image, $desription, $feature, $_GET['id']);
        if ($check) {
            $message = "Sua  thanh cong";
        } else {
            $message = " that bai";
        }
    }
    echo "<script type= 'text/javascript'>alert('$message');</script>";
    header("location: index.php");
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
            float: left;
            display: inline-block;
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
    <div id="search">
        <input type="text" placeholder="Search here..." />
        <button type="submit" class="tip-bottom" title="Search"><i class="icon-search icon-white"></i></button>
    </div>
    <!--close-top-serch-->
    <!--sidebar-menu-->
    <div id="sidebar"> <a href="#" class="visible-phone"><i class="icon icon-th"></i>Tables</a>
        <ul>
            <li><a href="index.php"><i class="icon icon-home"></i> <span>Dashboard</span></a> </li>
            <li> <a href="manufactures.php"><i class="icon icon-th-list"></i> <span>Manufactures</span></a></li>
            <li> <a href="protypes.php"><i class="icon icon-th-list"></i> <span>Product type</span></a></li>
            <li> <a href="users.php"><i class="icon icon-th-list"></i> <span>Users</span></a></li>
        </ul>
    </div><!-- BEGIN CONTENT -->
    <div id="content">
        <div id="content-header">
            <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom current"><i class="icon-home"></i>
                    Home</a></div>
            <h1>Change Product</h1>
        </div>
        <div class="container-fluid">
            <hr>
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box">
                        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
                            <h5>Product info</h5>
                        </div>
                        <div class="widget-content nopadding">
                            <!-- BEGIN USER FORM -->
                            <form action="" method="post" class="form-horizontal" enctype="multipart/form-data">
                                <div class="control-group">
                                    <label class="control-label">Name :</label>
                                    <div class="controls">
                                        <input value="<?php echo $product->name; ?>" type="text" class="span11" placeholder="Product name" name="name" />
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Choose a manufacture:</label>
                                    <div class="controls">
                                        <select name="manu_id" id="cate">
                                            <option value="<?php echo $manu1->manu_id; ?>"><?php echo $manu1->manu_name; ?> </option>
                                            <?php foreach ($manufactures as $manu) { ?>
                                                <option value="<?php echo $manu['manu_id']; ?>"><?php echo $manu['manu_name']; ?> </option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Choose a product type:</label>
                                    <div class="controls">
                                        <select name="type_id" id="subcate">
                                            <option value="<?php echo $type1->type_id; ?>"><?php echo $type1->type_name; ?></option>
                                            <?php foreach ($protypes as $protype) { ?>
                                                <option value="<?php echo $protype['type_id']; ?>"><?php echo $protype['type_name']; ?></option>
                                            <?php } ?>
                                        </select> *
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Choose an image :</label>
                                        <div class="controls">
                                            <input type="file" name="fileUpload" id="fileUpload">
                                            <img width="120" src="../images/<?php echo $product->pro_image; ?>" alt="" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Description</label>
                                        <div class="controls">
                                            <textarea class="span11" placeholder="Description" name="description" required><?php echo $product->description; ?> </textarea>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Price :</label>
                                            <div class="controls">
                                                <input value="<?php echo  $product->price; ?>" type="text" class="span11" placeholder="price" name="price" required /> *
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Feature :</label>
                                            <div class="controls">
                                                <input value="<?php echo  $product->feature; ?>" type="number" class="span11" name="feature" min="0" max="1" required /> *
                                            </div>
                                        </div>
                                        <div class="form-actions">
                                            <button type="submit" class="btn btn-success"> Change</button>
                                        </div>
                                    </div>
                            </form>
                            <!-- END USER FORM -->
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