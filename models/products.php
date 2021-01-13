<?php
class Product extends db
{
    function getAllProducts()
    {
        $sql = self::$connection->prepare("SELECT * FROM `products`,`protypes`,`manufactures` WHERE `products`.`status`=1 and  `products`.`manu_id`=`manufactures`.`manu_id` AND
        `products`.`type_id`=`protypes`.`type_id` ORDER BY  `products`.`id` DESC");
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_all(MYSQLI_ASSOC);
        return $items;
    }
    public   function getFeatureProducts()
    {
        $sql = self::$connection->prepare("SELECT * FROM products where `products`.`status`=1 and feature = 1 limit 3");
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_all(MYSQLI_ASSOC);
        return $items;
    }
    public   function getNewProducts()
    {
        $sql = self::$connection->prepare("SELECT * FROM products where `products`.`status`=1  ORDER BY created_at desc limit 3 ");
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_all(MYSQLI_ASSOC);
        return $items;
    }
    public   function getProductsFromID($id)
    {
        $sql = self::$connection->prepare("SELECT * FROM products ,protypes,manufactures WHERE protypes.type_id = products.type_id and manufactures.manu_id=products.manu_id and id = ? ");
        $sql->bind_param("i", $id);
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_object();
        return $items;
    }
    public   function getProductsManu($id)
    {
        $sql = self::$connection->prepare("SELECT * FROM products , manufactures WHERE products.manu_id= manufactures.manu_id AND manufactures.manu_id = ?");
        $sql->bind_param("i", $id);
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_all(MYSQLI_ASSOC);
        return $items;
    }
    public   function getProductsPrototype($id)
    {
        $sql = self::$connection->prepare("SELECT * FROM products ,protypes WHERE products.type_id=protypes.type_id and products.type_id=?   ");
        $sql->bind_param("i", $id);
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_all(MYSQLI_ASSOC);
        return $items;
    }
    public   function getProductsPrototypeandManu($id_type, $id_manu)
    {
        $sql = self::$connection->prepare("SELECT * FROM products ,protypes,manufactures WHERE protypes.type_id = products.type_id and manufactures.manu_id=products.manu_id and products.type_id=$id_type and  products.manu_id=$id_manu ");
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_all(MYSQLI_ASSOC);
        return $items;
    }
    public   function getProductsSearch($key)
    {
        $sql = self::$connection->prepare("SELECT * FROM `products` WHERE  `products`.`status`=1 and `description` like '%$key%'");
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_all(MYSQLI_ASSOC);
        return $items;
    }
    public function getProductsWithKeywordPagination($description, $page, $perPage)
    {
        $firstLink = ($page - 1) * $perPage;
        $sql = self::$connection->prepare("SELECT * FROM `products` LEFT JOIN protypes ON protypes.type_id = products.type_id LEFT JOIN manufactures on manufactures.manu_id = products.manu_id
        WHERE  `products`.`status`=1 and  `products`.`description` like '%$description%' 
        OR `products`.`name` like '%$description%' LIMIT $firstLink, $perPage");
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_all(MYSQLI_ASSOC);
        return $items;
    }
    public function getAllProductsPagination($page, $perPage)
    {
        $firstLink = ($page - 1) * $perPage;
        $sql = self::$connection->prepare("SELECT * FROM `products`  LEFT JOIN protypes ON protypes.type_id = products.type_id LEFT JOIN manufactures on manufactures.manu_id = products.manu_id where  `products`.`status`=1 and `products`.feature=1  ORDER BY  `products`.`id` DESC LIMIT $firstLink, $perPage ");
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_all(MYSQLI_ASSOC);
        return $items;
    }
    public function deleteProduct($id)
    {
        $sql = self::$connection->prepare("UPDATE `products` SET `status`=0  WHERE id = ? ");
        $sql->bind_param("i", $id);
        return  $sql->execute();
    }
    public function insertProduct($name, $manu_id, $type_id, $price, $pro_image, $description, $feature)
    {
        $sql = self::$connection->prepare("INSERT INTO 
        `products`(`name`, `manu_id`, `type_id`, `price`, `pro_image`, `description`, `feature`,`status`) 
        VALUES    (?,?,?,?,?,?,?,1)");
        $sql->bind_param("siiissi", $name, $manu_id, $type_id, $price, $pro_image, $description, $feature);
        return  $sql->execute();
    }
    public function updateProduct($name, $manu_id, $type_id, $price, $pro_image, $description, $feature, $id)
    {
        $sql = self::$connection->prepare("UPDATE `products` SET 
        `name`=?,`manu_id`=?,`type_id`=?,`price`=?,`pro_image`=?, `description`=?,`feature`=?
        WHERE id=?");
        $sql->bind_param("siiissii", $name, $manu_id, $type_id, $price, $pro_image, $description, $feature, $id);
        return  $sql->execute();
    }
}
