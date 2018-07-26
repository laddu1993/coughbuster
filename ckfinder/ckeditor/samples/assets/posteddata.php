<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title>Sample &mdash; CKEditor</title>
	<link rel="stylesheet" href="sample.css">
</head>
<body>
<?php
$Pname=$_POST['Pname'];
$Tname=$_POST['Tname'];
$Content=$_POST['editor1'];

echo $Pname;
echo $Tname;
echo $Content;

if (!empty($_POST))
{
	foreach ( $_POST as $key => $value )
	{
		if ( ( !is_string($value) && !is_numeric($value) ) || !is_string($key) )
			continue;

		if ( get_magic_quotes_gpc() )
			$value = htmlspecialchars( stripslashes((string)$value) );
		else
			$value = htmlspecialchars( (string)$value );
?>
	<?php
	}
}
?>
<?php
$dbhost = '208.91.199.11:3306';
$dbuser = 'aurea';
$dbpass = '12345';
$conn = mysql_connect($dbhost, $dbuser, $dbpass);
if(! $conn )
{
  die('Could not connect: ' . mysql_error());
}
$sql = "UPDATE ".$Tname." SET Content='".$Content."' WHERE Name='".$Pname."'";

mysql_select_db('havoc3n5_aurea');
$retval = mysql_query($sql, $conn);
if(! $retval )
{
  die('Could not update data: ' . mysql_error());
}
echo "<br /><br /><center><h2>Updated data successfully</h2></center>";
mysql_close($conn);
?>
</body>
</html>
