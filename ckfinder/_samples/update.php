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
  $content = $_POST['editor1'];
  $tags = $_POST['tags'];
  $description = $_POST['des'];
  $lmo = date("Y-m-d");
mysql_query("UPDATE Pages SET LMO='$lmo', Tags='$tags', Description='$des', Content='$content' WHERE Id='$id'");
}
 header("location: http://www.shantanutextiles.in/admin/website-pages.php");
ob_end_flush();
?>