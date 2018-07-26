<?php 
$pname = $_GET['name'];
$tname = $_GET['page'];
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>CKFinder - Sample - CKEditor Integration</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="robots" content="noindex, nofollow" />
	<link href="sample.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="../ckfinder.js"></script>
</head>
<body>
<form action="../ckeditor/samples/assets/posteddata.php" method="post">
	<h2><?php echo $pname; ?></h2>
		<input type="hidden" name="Pname" value="<?php echo $pname; ?>">
		<input type="hidden" name="Tname" value="<?php echo $tname; ?>">
		<textarea id="editor1" name="editor1" rows="12" cols="85">
		<?php
	// Connect to database server
	mysql_connect("localhost", "aurearqz_aurea", "abcd1234") or die (mysql_error ());

	// Select database
	mysql_select_db("aurearqz_aurea") or die(mysql_error());

	// SQL query
	$strSQL = "SELECT Content FROM ".$tname." WHERE Name='".$pname."'";
	// Execute the query (the recordset $rs contains the result)
	$rs = mysql_query($strSQL);
	
	// Loop the recordset $rs
	// Each row will be made into an array ($row) using mysql_fetch_array
	while($row = mysql_fetch_array($rs)) {
	   // Write the value of the column FirstName (which is now in the array $row)
	 echo $row['Content'];
	  }
	// Close the database connection
	mysql_close();
	?>
	
	</textarea>

		<script type="text/javascript">

// This is a check for the CKEditor class. If not defined, the paths must be checked.
if ( typeof CKEDITOR == 'undefined' )
{
	document.write(
		'<strong><span style="color: #ff0000">Error</span>: CKEditor not found</strong>.' +
		'This sample assumes that CKEditor (not included with CKFinder) is installed in' +
		'the "/ckeditor/" path. If you have it installed in a different place, just edit' +
		'this file, changing the wrong paths in the &lt;head&gt; (line 5) and the "BasePath"' +
		'value (line 32).' ) ;
}
else
{
	var editor = CKEDITOR.replace( 'editor1' );

	// Just call CKFinder.setupCKEditor and pass the CKEditor instance as the first argument.
	// The second parameter (optional), is the path for the CKFinder installation (default = "/ckfinder/").
	CKFinder.setupCKEditor( editor, '../' ) ;

	// It is also possible to pass an object with selected CKFinder properties as a second argument.
	// CKFinder.setupCKEditor( editor, { basePath : '../', skin : 'v1' } ) ;
}

		</script>
		<input type="submit" value="submit">
	</form>
</body>
</html>
