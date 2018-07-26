<?php

$link = mysql_connect('localhost', 'shantxo2_website', 'havoc3n5');
if (!$link) {
    die('Not connected : ' . mysql_error());
}

// make foo the current db
$db_selected = mysql_select_db('shantxo2_website', $link);
if (!$db_selected) {
    die ('Can not use the database : ' . mysql_error());
}
?>