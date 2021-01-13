<?php

class User extends Db
{
    public   function getUserFromUsername($usename)
    {
        $sql = self::$connection->prepare("SELECT * FROM `user_` WHERE username = ?");
        $sql->bind_param("s", $usename);
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_object();
        return $items;
    }
    // Tao user
    public function createUser($username, $password, $fullname, $email, $birthday, $gender, $phone)
    {
        $sql = self::$connection->prepare("INSERT INTO `user_`(`username`, `password`, `fullname`, `email`, `birthdate`, `gender`, `phone`,`status`) 
                                                         VALUES (?,?,?,?,?,?,?,1)");
        $sql->bind_param("sssssss", $username, $password, $fullname, $email, $birthday, $gender, $phone);
        return  $sql->execute();
    }
    public   function getAllUser()
    {
        $sql = self::$connection->prepare("SELECT * FROM `user_` ");
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_all(MYSQLI_ASSOC);
        return $items;
    }
    // Xoa user (Trang thai == 0)
    public function delete($username)
    {
        $sql = self::$connection->prepare("UPDATE `user_` SET `status`=0 WHERE `username`=?");
        $sql->bind_param("s", $username);
        return  $sql->execute();
    }
    // capa nhat thong tin user:
    public function update($fullname, $email, $birthday, $gender, $phone, $username)
    {
        $sql = self::$connection->prepare("UPDATE `user_` SET `fullname`=?,`email`=?,`birthdate`=?,`gender`=?,`phone`=? WHERE username=?");
        $sql->bind_param("ssssss", $fullname, $email, $birthday, $gender, $phone, $username);
        return  $sql->execute();
    }
}
