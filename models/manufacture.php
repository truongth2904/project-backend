<?php

class ManuFactures extends Db
{
    public function getAllManuFactures()
    {
        $sql = self::$connection->prepare("SELECT * FROM `manufactures`");
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_all(MYSQLI_ASSOC);
        return $items;
    }
    public function getAllManuFacturesFromID($id)
    {
        $sql = self::$connection->prepare("SELECT * FROM `manufactures` where `manu_id`=?");
        $sql->bind_param("i", $id);
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_all(MYSQLI_ASSOC);
        return $items;
    }
    public function getAllManuSearch($key)
    {
        $sql = self::$connection->prepare("SELECT * FROM `products` WHERE products.description LIKE '%?%'");
        $sql->bind_param("i", $key);
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_all(MYSQLI_ASSOC);
        return $items;
    }
    public function deleteManuFacTurFromID($id)
    {
        $sql = self::$connection->prepare("DELETE FROM manufactures where manu_id = ?");
        $sql->bind_param("i", $id);
        $sql->execute();
    }
    public function insertManuFacTurFromID($manu_name)
    {
        $sql = self::$connection->prepare("INSERT INTO `manufactures`( `manu_name`) VALUES (?)");
        $sql->bind_param("s", $manu_name);
        $sql->execute();
    }
    public function getManuID($id)
    {
        $sql = self::$connection->prepare("SELECT * FROM `manufactures` WHERE manufactures.manu_id = ?");
        $sql->bind_param("i",  $id);
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_object();
        return $items;
    }
    public function updateManu($id, $manu_name)
    {
        $sql = self::$connection->prepare("UPDATE `manufactures` SET `manu_name`=? WHERE `manu_id`=?");
        $sql->bind_param("si",  $manu_name, $id);
        $sql->execute();
    }
}
