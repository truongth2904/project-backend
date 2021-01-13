<?php
class Admin extends Db
{
    public   function getAdminFromAdmin($admin)
    {
        $sql = self::$connection->prepare("SELECT * FROM `admin` WHERE admin=?");
        $sql->bind_param("s", $admin);
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_object();
        return $items;
    }
}
