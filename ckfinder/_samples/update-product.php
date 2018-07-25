<?php ob_start();
session_start();
 
if(!session_is_registered(myusername)){
  header("location: http://www.shantanutextiles.in/admin/index.php");
}
else
{
	include("config.php");
// Check connection
  
  $id = $_POST['id'];
  $name = $_POST['name'];
  $content = $_POST['editor1'];
  $sequence = $_POST['sequence'];
mysql_query("UPDATE products SET Pname='$name', Pcontent='$content', Sequence='$sequence' WHERE Id='$id'");
}
 header("location: http://www.shantanutextiles.in/product-details.php");
ob_end_flush();
?>