<?php
$key = "";
if (isset($_GET['key'])) $key = $_GET['key'];
?>
<div id="search">
    <form action="index.php">
        <input type="text" name="key" placeholder="Search here..." value="<?php echo $key ?>" />
        <button type="submit" class="tip-bottom" title="Search"><i class="icon-search icon-white"></i></button>
    </form>
</div>