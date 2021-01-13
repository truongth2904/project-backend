<?php
class Protypes extends Db
{
    public function getAllProtypes()
    {
        $sql = self::$connection->prepare("SELECT * FROM protypes");
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_all(MYSQLI_ASSOC);
        return $items;
    }
    public function deletePrototypeFromID($id)
    {
        $sql = self::$connection->prepare("DELETE FROM protypes where `type_id` = ?");
        $sql->bind_param("i", $id);
        $sql->execute();
    }
    public function insertPrototypeFromID($name)
    {
        $sql = self::$connection->prepare("INSERT INTO `protypes`( `type_name`) VALUES (?)");
        $sql->bind_param("s", $name);
        $sql->execute();
    }
    public function getTypeID($id)
    {
        $sql = self::$connection->prepare("SELECT * FROM protypes where `type_id`=?");
        $sql->bind_param("i", $id);
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_object();
        return $items;
    }
    public function updateprotype($id, $name)
    {
        $sql = self::$connection->prepare("UPDATE `protypes` SET `type_name`=? WHERE `type_id`=?");
        $sql->bind_param("si", $name, $id);
        $sql->execute();
    }
}
