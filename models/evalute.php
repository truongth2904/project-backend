<?php

class Evalute extends Db
{
    // Lấy số sao của sản phẩm
    public function getAllevaluteByID_product($id)
    {
        $sql = self::$connection->prepare("SELECT * FROM `evalute` WHERE `evalute`.`id_product` = ?");
        $sql->bind_param("i", $id);
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_all(MYSQLI_ASSOC);
        return $items;
    }
    // đánh giá cho sản phẩm
    public function insertEvalute($id, $point, $username)
    {
        $sql = self::$connection->prepare("INSERT INTO `evalute`(`username`, `id_product`, `point`) VALUES (?,?,?)");
        $sql->bind_param("sii", $username, $id, $point);
        return  $sql->execute();
    }
    // Lấy thông tin của người dùng đã đánh giá sản phẩm:
    public function getInFo($id_product,$username)
    {
        $sql = self::$connection->prepare("SELECT * FROM `evalute` WHERE `evalute`.`id_product` = ? and `evalute`.`username`=?");
        $sql->bind_param("is", $id_product,$username);
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_object();
        return $items;
    }
    // lấy tất cả số sao của các sản phẩm:
    public function getAllEvalute()
    {
        $sql = self::$connection->prepare("SELECT * FROM `evalute` ");
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_all(MYSQLI_ASSOC);
        return $items;
    }
}
