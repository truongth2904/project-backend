<?php 

foreach ($protypes as $protype) { ?>
    <li class="drop"><a href="product-grid.php?type=<?php echo $protype['type_id'] ?>"><?php echo $protype['type_name'] ?></a>
    </li>
<?php } ?>