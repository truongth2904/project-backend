<?php
class Comment extends Db
{
    // Lấy tất cả comment của sản phẩm 
    public function getAllCommentById_Product($id)
    {
        $sql = self::$connection->prepare("SELECT * FROM comment,user_ WHERE comment.username = `user_`.`username` and `comment`.`id_product`=?");
        $sql->bind_param("i", $id);
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_all(MYSQLI_ASSOC);
        return $items;
    }
    // Lấy tất cả comment:
    public function getAllComment()
    {
        $sql = self::$connection->prepare("SELECT * FROM `comment` ");
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_all(MYSQLI_ASSOC);
        return $items;
    }
    // Lay comment của username đối với một sản phẩm nào đó
    public function getCommentUsernameById_Product($username, $id)
    {
        $sql = self::$connection->prepare("SELECT * FROM `comment` WHERE comment.username=? and comment.id_product=?");
        $sql->bind_param("si", $username, $id);
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_object();
        return $items;
    }
    // Chèn comment vào:
    public function insertCommentOnID($id, $content, $username)
    {
        $sql = self::$connection->prepare("INSERT INTO `comment`(`id_product`, `content`, `username`) VALUES (?,?,?)");
        $sql->bind_param("iss", $id, $content, $username);
        return  $sql->execute();
    }
    
}
