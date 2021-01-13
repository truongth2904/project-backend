<?php
class Cart extends Db
{
    // Lấy tất cả sản phẩm hiên đang có trong giỏ hàng và chưa đang kí
    public   function getAllProductOnUsernameInCard($usename)
    {
        $sql = self::$connection->prepare("SELECT * FROM `card`,`products` WHERE `card`.`id_product`=`products`.`id`and `card`.`status`=1 AND `card`.`username` = ?");
        $sql->bind_param("s", $usename);
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_all(MYSQLI_ASSOC);
        return $items;
    }
    // Thêm sản phẩm mới vào giỏ hàng
    public   function insertInCartOnUser($id, $usename, $amount_product)
    {
        $sql = self::$connection->prepare("INSERT INTO `card`(`id_product`, `username`, `amount_product`,`status`) VALUES (?,?,?,1)");
        $sql->bind_param("isi", $id, $usename, $amount_product);
        return  $sql->execute();
    }
    // Xóa một sản phẩm ra khỏi giỏ hàng
    public function deleteCartOnId($id, $username)
    {
        $sql = self::$connection->prepare("DELETE FROM `card` where `card`.`status`=1  and `id_product` = ? and username = ?");
        $sql->bind_param("is", $id, $username);
        return  $sql->execute();
    }
    // Cập nhật lại số lượng cho giỏ hàng
    public function updateCartOnId($id, $usename, $amount_product)
    {
        $sql = self::$connection->prepare("UPDATE `card` SET `amount_product`=? WHERE  `card`.`status`=1  and id_product=? and username=?");
        $sql->bind_param("iis", $amount_product, $id, $usename);
        return $sql->execute();
    }
    // Lấy một sản phẩm trong giỏ hàng
    public function getCartOnId($id, $username)
    {
        $sql = self::$connection->prepare("SELECT * FROM `card` WHERE `card`.`status`=1 and `card`.`username` = ? and `card`.`id_product`=?");
        $sql->bind_param("is", $id, $username);
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_object();
        return $items;
    }
    // Đăng kí các sản phẩm trong giỏ hàng 
    public function registrationCartOnId($usename)
    {
        $sql = self::$connection->prepare("UPDATE `card` SET `card`.`status`=0  WHERE   username=?");
        $sql->bind_param("s", $usename);
        return $sql->execute();
    }
    // Lấy tất cả sản phẩm đã đăng kí 
    public   function getAllProductOrderOnUsername($usename)
    {
        $sql = self::$connection->prepare("SELECT * FROM `card`,`products` WHERE `card`.`id_product`=`products`.`id`and `card`.`status`=0 AND `card`.`username` = ?");
        $sql->bind_param("s", $usename);
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_all(MYSQLI_ASSOC);
        return $items;
    }
    // Cập nhật số lượng cho các mặt hàng đã đăng kí
    public function updateCartedOnId($id, $usename, $amount_product)
    {
        $sql = self::$connection->prepare("UPDATE `card` SET `amount_product`=? WHERE  `card`.`status`=0  and id_product=? and username=?");
        $sql->bind_param("iis", $amount_product, $id, $usename);
        return $sql->execute();
    }
}
