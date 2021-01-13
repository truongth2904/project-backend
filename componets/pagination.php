<?php
class Pagination
{
    public static $perPage = 12;
    public static $page = 1;

    public function __construct()
    {
        if (isset($_GET['page'])) {
            self::$page = $_GET['page'];
        }
    }

    function paginate($url, $total)
    {
        $totalLinks = ceil($total / self::$perPage);
        $link = "";
        for ($j = 1; $j <= $totalLinks; $j++) {
            $active = self::$page == $j ? "class='active'" : '';
            $link = $link . "<li $active><a href='$url&page=$j'> $j </a><li>";
        }
        return $link;
    }
}
