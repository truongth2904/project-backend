<?php
session_start();
require "app.php";

$productModel = new Product();
$protypeModel = new Protypes();
$manuFacturesModel = new ManuFactures();
$cartModel = new Cart();
$url = $_SERVER['PHP_SELF'];
$pagination = new Pagination();

$products = $productModel->getAllProducts();
$protypes = $protypeModel->getAllProtypes();
$manuFactures = $manuFacturesModel->getAllManuFactures();

if (!isset($_SESSION['username'])) {
    header("Location: login.php");
}
$key = "";
if (isset($_GET['key'])) {
    $key = $_GET['key'];
    $productssearch = $productModel->getProductsSearch($key);
    $productsPagination = $productModel->getProductsWithKeywordPagination($_GET['key'], $pagination::$page, $pagination::$perPage);
}
if (isset($_SESSION['username'])) {
    $carts = $cartModel->getAllProductOnUsernameInCard($_SESSION['username']);
}

?>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Asbab - eCommerce HTML5 Templatee</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Place favicon.ico in the root directory -->
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">
    <link rel="apple-touch-icon" href="apple-touch-icon.png">


    <!-- All css files are included here. -->
    <!-- Bootstrap fremwork main css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Owl Carousel min css -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <!-- This core.css file contents all plugings css file. -->
    <link rel="stylesheet" href="css/core.css">
    <!-- Theme shortcodes/elements style -->
    <link rel="stylesheet" href="css/shortcode/shortcodes.css">
    <!-- Theme main style -->
    <link rel="stylesheet" href="style.css">
    <!-- Responsive css -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- User style -->
    <link rel="stylesheet" href="css/custom.css">


    <!-- Modernizr JS -->
    <script src="js/vendor/modernizr-3.5.0.min.js"></script>
</head>
<style>
    .ht__cat__thumb {
        display: block;
        height: auto;
        margin: auto;
        cursor: pointer;
        max-width: 100%;
        width: 250px;
        height: 250px;
    }

    .category {
        height: 500px;
    }

    .header__account a {
        color: #000;
        font-size: 15px;
        margin-right: 10px;
        padding-right: 10px;
    }

    a.logout {
        padding-left: 18px;
    }
</style>

<body>
    <!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->

    <!-- Body main wrapper start -->
    <div class="wrapper">
        <!-- Start Header Style -->
        <header id="htc__header" class="htc__header__area header--one">
            <!-- Start Mainmenu Area -->
            <div id="sticky-header-with-topbar" class="mainmenu__wrap sticky__header">
                <div class="container">
                    <div class="row">
                        <div class="menumenu__container clearfix">
                            <div class="col-lg-2 col-md-2 col-sm-3 col-xs-5">
                                <div class="logo">
                                    <a href="index.php"><img src="admin/images/mobile-store-logo_8050-351.jpg" alt="logo images"></a>
                                </div>
                            </div>
                            <div class="col-md-7 col-lg-8 col-sm-5 col-xs-3">
                                <nav class="main__menu__nav hidden-xs hidden-sm">
                                    <ul class="main__menu">
                                        <li class="drop"><a href="index.php">Home</a></li>
                                        <?php require "menu.php"; ?>
                                    </ul>
                                </nav>
                            </div>
                            <div class="col-md-3 col-lg-2 col-sm-4 col-xs-4">
                                <div class="header__right">
                                    <div class="header__search search ">
                                        <form action="" method="get">
                                            <input type="text" placeholder="Search" name="key" />
                                        </form>
                                    </div>
                                    <div class="header__account">
                                        <a href="#"><i class="icons"></i></a>
                                    </div>
                                    <div class="htc__shopping__cart">
                                        <a class="cart__menu" href="#"><i class="icon-handbag icons"></i></a>
                                        <a href="#"><span class="htc__qua"><?php echo count($carts) ?></span></a>
                                    </div>
                                    <div class="header__account">
                                    </div>
                                    <a class="logout" href="logout.php"><i class="fa fa-sign-out" aria-hidden="true"> </i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mobile-menu-area"></div>
                </div>
            </div>
            <!-- End Mainmenu Area -->
        </header>
        <!-- End Header Area -->

        <div class="body__overlay"></div>
        <!-- Start Offset Wrapper -->
        <div class="offset__wrapper">
            <!-- Start Search Popap -->
            <div class="search__area">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="search__inner">
                                <form action="#" method="get">
                                    <input placeholder="Search here... " type="text">
                                    <button type="submit"></button>
                                </form>
                                <div class="search__close__btn">
                                    <span class="search__close__btn_icon"><i class="zmdi zmdi-close"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Search Popap -->
            <!-- Start Cart Panel -->
            <div class="shopping__cart">
                <div class="shopping__cart__inner">
                    <div class="offsetmenu__close__btn">
                        <a href="#"><i class="zmdi zmdi-close"></i></a>
                    </div>
                    <div class="shp__cart__wrap">
                        <?php $fulltotal = 0;
                        foreach ($carts as $cart) { ?>
                            <?php $total = $cart['price'] *  $cart['amount_product'];
                            $fulltotal += $total; ?>
                            <div class="shp__single__product">
                                <div class="shp__pro__thumb">
                                    <a href="#">
                                        <img src="images\<?php echo $cart['pro_image'] ?>" alt="product images">
                                    </a>
                                </div>
                                <div class="shp__pro__details">
                                    <h2><a href="product-details.php"><?php echo $cart['name'] ?></a></h2>
                                    <span class="quantity"><?php echo $cart['amount_product'] ?></span>
                                    <span class="shp__price"><?php echo number_format($total); ?></span>
                                </div>
                                <div class="remove__btn">
                                    <a href="#" title="Remove this item"><i class="zmdi zmdi-close"></i></a>
                                </div>
                            </div>
                        <?php } ?>
                    </div>
                    <ul class="shoping__total">
                        <li class="subtotal">Subtotal:</li>
                        <li class="total__price"><?php echo number_format($fulltotal)  . "VND"; ?></li>
                    </ul>
                    <ul class="shopping__btn">
                        <li><a href="cart.php">View Cart</a></li>
                    </ul>
                </div>
            </div>
            <!-- End Cart Panel -->
        </div>
        <!-- End Offset Wrapper -->
        <!-- Start Category Area -->
        <section class="htc__category__area ptb--100">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="section__title--2 text-center">
                            <h2 class="title__line">Search Product </h2>
                            <p></p>
                        </div>
                    </div>
                </div>
                <div class="htc__product__container">
                    <div class="row">
                        <div class="product__list clearfix mt--30">
                            <!-- Start Single Category -->
                            <?php if (count($productssearch) == 0) echo "Không tìm thấy sản phẩm nào !"; ?>
                            <?php
                            foreach ($productsPagination as $product) { ?>
                                <div class="col-md-4 col-lg-3 col-sm-4 col-xs-12">
                                    <div class="category">
                                        <div class="ht__cat__thumb">
                                            <a href="product-details.php?id=<?php echo $product['id']; ?>">
                                                <img src="images\<?php echo $product['pro_image'] ?>" alt="product images">
                                            </a>
                                        </div>
                                        <div class="fr__product__inner">
                                            <h4><a href="product-details.php?id=<?php echo $product['id']; ?>"><?php echo $product['name'] ?></a></h4>
                                            <ul class="fr__pro__prize">
                                                <li><?php echo number_format($product['price'])  ?></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            <?php } ?>
                        </div>
                        <div class="col-sm-12" style="display: flex; justify-content: center;">
                            <ul class="pagination">
                                <?php
                                $previous = $pagination::$page - 1;
                                if ($previous > 0) {
                                ?>
                                    <li><a href="<?php echo "$url?key=$key&page=$previous" ?>">
                                            <<< /a>
                                    </li> <?php } ?> <?php echo $pagination->paginate("$url?key=$key", count($productssearch)); ?> <?php
                                                                                                                                    $next = $pagination::$page + 1;
                                                                                                                                    if ($pagination::$page < count($productssearch) / $pagination::$perPage) {
                                                                                                                                    ?> <li><a href="<?php echo "$url?key=$key&page=$next" ?>">>></a></li><?php } ?>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Category Area -->
        <!-- Start Footer Area -->
        <footer id="htc__footer">
            <!-- Start Footer Widget -->
            <div class="footer__container bg__cat--1">
                <div class="container">
                    <div class="row">
                        <!-- Start Single Footer Widget -->
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="footer">
                                <h2 class="title__line--2">ABOUT US</h2>
                                <div class="ft__details">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                        incididunt ut labore et dolore magna aliqua. Ut enim</p>
                                    <div class="ft__social__link">
                                        <ul class="social__link">
                                            <li><a href="#"><i class="icon-social-twitter icons"></i></a></li>

                                            <li><a href="#"><i class="icon-social-instagram icons"></i></a></li>

                                            <li><a href="#"><i class="icon-social-facebook icons"></i></a></li>

                                            <li><a href="#"><i class="icon-social-google icons"></i></a></li>

                                            <li><a href="#"><i class="icon-social-linkedin icons"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Footer Widget -->
                        <!-- Start Single Footer Widget -->
                        <div class="col-md-2 col-sm-6 col-xs-12 xmt-40">
                            <div class="footer">
                                <h2 class="title__line--2">information</h2>
                                <div class="ft__inner">
                                    <ul class="ft__list">
                                        <li><a href="#">About us</a></li>
                                        <li><a href="#">Delivery Information</a></li>
                                        <li><a href="#">Privacy & Policy</a></li>
                                        <li><a href="#">Terms & Condition</a></li>
                                        <li><a href="#">Manufactures</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Footer Widget -->
                        <!-- Start Single Footer Widget -->
                        <div class="col-md-2 col-sm-6 col-xs-12 xmt-40 smt-40">
                            <div class="footer">
                                <h2 class="title__line--2">my account</h2>
                                <div class="ft__inner">
                                    <ul class="ft__list">
                                        <li><a href="#">My Account</a></li>
                                        <li><a href="cart.html">My Cart</a></li>
                                        <li><a href="#">Login</a></li>
                                        <li><a href="wishlist.html">Wishlist</a></li>
                                        <li><a href="checkout.html">Checkout</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Footer Widget -->
                        <!-- Start Single Footer Widget -->
                        <div class="col-md-2 col-sm-6 col-xs-12 xmt-40 smt-40">
                            <div class="footer">
                                <h2 class="title__line--2">Our service</h2>
                                <div class="ft__inner">
                                    <ul class="ft__list">
                                        <li><a href="#">My Account</a></li>
                                        <li><a href="cart.html">My Cart</a></li>
                                        <li><a href="#">Login</a></li>
                                        <li><a href="wishlist.html">Wishlist</a></li>
                                        <li><a href="checkout.html">Checkout</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Footer Widget -->
                        <!-- Start Single Footer Widget -->
                        <div class="col-md-3 col-sm-6 col-xs-12 xmt-40 smt-40">
                            <div class="footer">
                                <h2 class="title__line--2">NEWSLETTER </h2>
                                <div class="ft__inner">
                                    <div class="news__input">
                                        <input type="text" placeholder="Your Mail*">
                                        <div class="send__btn">
                                            <a class="fr__btn" href="#">Send Mail</a>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- End Single Footer Widget -->
                    </div>
                </div>
            </div>
            <!-- End Footer Widget -->
            <!-- Start Copyright Area -->
            <div class="htc__copyright bg__cat--5">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="copyright__inner">
                                <p>Copyright© <a href="https://freethemescloud.com/">Free themes Cloud</a> 2018. All
                                    right reserved.</p>
                                <a href="#"><img src="images/others/shape/paypol.png" alt="payment images"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Copyright Area -->
        </footer>
        <!-- End Footer Style -->
    </div>
    <!-- Body main wrapper end -->

    <!-- Placed js at the end of the document so the pages load faster -->

    <!-- jquery latest version -->
    <script src="js/vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap framework js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- All js plugins included in this file. -->
    <script src="js/plugins.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <!-- Waypoints.min.js. -->
    <script src="js/waypoints.min.js"></script>
    <!-- Main js file that contents all jQuery plugins activation. -->
    <script src="js/main.js"></script>

</body>

</html>