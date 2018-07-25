<?php ob_start();
session_start();
 
if(!session_is_registered(myusername)){
  header("location:http://www.shantanutextiles.in/admin/index.php");
}
	include("config.php");
	
	$id = $_GET['pid'];
	
$result = mysql_query("SELECT * FROM Pages WHERE Id = $id");

while($row = mysql_fetch_array($result))
  {
  $id = $row['Id'];
  $name = $row['Name'];
  $content = $row['Content'];
  $tags = $row['Tags'];
  $description = $row['Description'];
  $status = $row['Status'];
  $lmo = $row['LMO'];
  $link = $row['Link'];
  }
 
?>
<!DOCTYPE html>
<html lang="en">
<head>
	
	<meta charset="utf-8">
	<title>Shantanu Textiles - Admin Panel - Edit <?php echo $name; ?> Page</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- The styles -->
	<link id="bs-css" href="http://www.shantanutextiles.in/admin/css/bootstrap-cerulean.css" rel="stylesheet">
	<style type="text/css">
	  body {
		padding-bottom: 40px;
	  }
	  .sidebar-nav {
		padding: 9px 0;
	  }
	</style>
	<link href="http://www.shantanutextiles.in/admin/css/bootstrap-responsive.css" rel="stylesheet">
	<link href="http://www.shantanutextiles.in/admin/css/charisma-app.css" rel="stylesheet">
	<link href="http://www.shantanutextiles.in/admin/css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
	<link href='http://www.shantanutextiles.in/admin/css/fullcalendar.css' rel='stylesheet'>
	<link href='http://www.shantanutextiles.in/admin/css/fullcalendar.print.css' rel='stylesheet'  media='print'>
	<link href='http://www.shantanutextiles.in/admin/css/chosen.css' rel='stylesheet'>
	<link href='http://www.shantanutextiles.in/admin/css/uniform.default.css' rel='stylesheet'>
	<link href='http://www.shantanutextiles.in/admin/css/colorbox.css' rel='stylesheet'>
	<link href='http://www.shantanutextiles.in/admin/css/jquery.cleditor.css' rel='stylesheet'>
	<link href='http://www.shantanutextiles.in/admin/css/jquery.noty.css' rel='stylesheet'>
	<link href='http://www.shantanutextiles.in/admin/css/noty_theme_default.css' rel='stylesheet'>
	<link href='http://www.shantanutextiles.in/admin/css/elfinder.min.css' rel='stylesheet'>
	<link href='http://www.shantanutextiles.in/admin/css/elfinder.theme.css' rel='stylesheet'>
	<link href='http://www.shantanutextiles.in/admin/css/jquery.iphone.toggle.css' rel='stylesheet'>
	<link href='http://www.shantanutextiles.in/admin/css/opa-icons.css' rel='stylesheet'>
	<link href='http://www.shantanutextiles.in/admin/css/uploadify.css' rel='stylesheet'>

	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!-- The fav icon -->
	<link rel="shortcut icon" href="http://www.shantanutextiles.in/img/favicon.ico">
	<link href="http://www.shantanutextiles.in/admin/ckfinder/_samples/sample.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="http://www.shantanutextiles.in/admin/ckfinder/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="http://www.shantanutextiles.in/admin/ckfinder/ckfinder.js"></script>

</head>

<body>
		<!-- topbar starts -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="http://www.shantanutextiles.in/admin/home.php">Admin Panel</a>
				
				<!-- user dropdown starts -->
				<div class="btn-group pull-right" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-user"></i><span class="hidden-phone"> Welcome <?php echo $_SESSION['myusername']; ?></span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="edit-user.php?name=<?php echo $_SESSION['myusername']; ?>">Profile</a></li>
						<li class="divider"></li>
						<li><a href="logout.php">Logout</a></li>
					</ul>
				</div>
				<!-- user dropdown ends -->
				
				<div class="top-nav nav-collapse">
					<ul class="nav">
						<li><a href="http://www.shantanutextiles.in/">Visit Site</a></li>
						<li><a href="http://www.havock.org">Visit Havock Web Designers</a></li>
					</ul>
				</div><!--/.nav-collapse -->
			</div>
		</div>
	</div>
	<!-- topbar ends -->
		<div class="container-fluid">
		<div class="row-fluid">
				
			<!-- left menu starts -->
			<div class="span2 main-menu-span">
				<div class="well nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li><a class="ajax-link" href="http://www.shantanutextiles.in/admin/home.php"><i class="icon-home"></i><span class="hidden-tablet"> Dashboard</span></a></li>
						<li class="nav-header hidden-tablet">Website Settings</li>
						<li><a class="ajax-link" href="http://www.shantanutextiles.in/admin/website-pages.php"><i class="icon-align-justify"></i><span class="hidden-tablet"> Website Pages</span></a></li>
						<li><a class="ajax-link" href="http://www.shantanutextiles.in/admin/product-details.php"><i class="icon-align-justify"></i><span class="hidden-tablet"> Product Details</span></a></li>
						<li><a class="ajax-link" href="http://www.shantanutextiles.in/admin/website-links.php"><i class="icon-edit"></i><span class="hidden-tablet"> Get In Touch</span></a></li>
						<li><a class="ajax-link" href="http://www.shantanutextiles.in/admin/file-manager.php"><i class="icon-folder-open"></i><span class="hidden-tablet"> File Manager</span></a></li>
						<li><a class="ajax-link" href="http://www.shantanutextiles.in/admin/user-management.php"><i class="icon-user"></i><span class="hidden-tablet"> User Management</span></a></li>
						<li class="nav-header hidden-tablet">Hear From Us</li>
						<li><a class="ajax-link" href="http://www.shantanutextiles.in/admin/statistics.php"><i class="icon-list-alt"></i><span class="hidden-tablet"> Statistics</span></a></li>
						<li><a class="ajax-link" href="http://www.shantanutextiles.in/admin/project-details.php"><i class="icon-star"></i><span class="hidden-tablet"> Project Details</span></a></li>
						<li><a class="ajax-link" href="http://www.shantanutextiles.in/admin/contact-details.php"><i class="icon-th"></i><span class="hidden-tablet"> Contact Us</span></a></li>
					</ul>
				</div><!--/.well -->
			</div><!--/span-->
			<!-- left menu ends -->
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<div id="content" class="span10">
			<!-- content starts -->
			

			<div>
				<ul class="breadcrumb">
					<li>
						<a href="http://www.shantanutextiles.in/admin/home.php">Home</a> <span class="divider">/</span>
					</li>
					<li>
						<a href="edit-page.php">Edit</a>
					</li>
				</ul>
			</div>
			
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-edit"></i> Edit <?php echo $name; ?> Page</h2>
					</div>
					<div class="box-content">
						<form  action="update.php" method="POST" class="form-horizontal">
						  <fieldset>
							<legend>Edit <?php echo $name; ?> Page Details</legend>
							<input type="hidden" name="id" value="<?php echo $id; ?>">
							<div class="control-group">
							  <label class="control-label" for="typeahead">Page Name</label>
							  <div class="controls">
								<span style="width:350px;" class="input-xlarge uneditable-input"><?php echo $name; ?></span>
							  </div>
							</div>
							<div class="control-group">
							  <label class="control-label" for="date01">Last Modified</label>
							  <div class="controls">
								<span style="width:350px;" class="input-xlarge uneditable-input"><?php echo $lmo; ?></span>
							  </div>
							</div>
							<div class="control-group">
								<label class="control-label" for="inputWarning">Meta Tags</label>
								<div class="controls">
								  <input type="text" style="width:350px;" name="tags" id="inputWarning" value="<?php echo $tags; ?>"><br />
								  <span class="help-inline">Insert comma separated values. Edit only if you have a relative knowledge. eg(keyword1,keyword2)</span>
								</div>
							  </div>
							<div class="control-group">
								<label class="control-label" for="inputWarning">Meta Description</label>
								<div class="controls">
								  <input type="text" style="width:350px;" name="des" id="inputWarning" value="<?php echo $description; ?>"><br />
								  <span class="help-inline">A short description about this page. Edit only if you have a relative knowledge.</span>
								</div>
							</div>    
							<div class="control-group">
							  <label class="control-label" for="textarea2">Body Content</label>
							  <div class="controls">
								<textarea id="editor1" name="editor1" rows="10" cols="80"><?php echo $content; ?></textarea>
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
	CKFinder.setupCKEditor( editor, 'http://www.shantanutextiles.in/admin/ckfinder/' ) ;

	// It is also possible to pass an object with selected CKFinder properties as a second argument.
	// CKFinder.setupCKEditor( editor, { basePath : '../', skin : 'v1' } ) ;
}

		</script>
							  </div>
							</div>
							<div class="form-actions">
							  <button type="submit" class="btn btn-primary">Save changes</button>
							  <button type="reset" class="btn">Cancel</button>
							</div>
						  </fieldset>
						</form>   

					</div>
				</div><!--/span-->

			</div><!--/row-->
			    
					<!-- content ends -->
			</div><!--/#content.span10-->
				</div><!--/fluid-row-->
				
		<hr>

		<footer>
			<p class="pull-left">Copyright &copy; 2013 Havock Web Designers</p>
		</footer>
		
	</div><!--/.fluid-container-->

	<!-- external javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<!-- jQuery -->
	<script src="http://www.shantanutextiles.in/admin/js/jquery-1.7.2.min.js"></script>
	<!-- jQuery UI -->
	<script src="http://www.shantanutextiles.in/admin/js/jquery-ui-1.8.21.custom.min.js"></script>
	<!-- transition / effect library -->
	<script src="http://www.shantanutextiles.in/admin/js/bootstrap-transition.js"></script>
	<!-- alert enhancer library -->
	<script src="http://www.shantanutextiles.in/admin/js/bootstrap-alert.js"></script>
	<!-- modal / dialog library -->
	<script src="http://www.shantanutextiles.in/admin/js/bootstrap-modal.js"></script>
	<!-- custom dropdown library -->
	<script src="http://www.shantanutextiles.in/admin/js/bootstrap-dropdown.js"></script>
	<!-- scrolspy library -->
	<script src="http://www.shantanutextiles.in/admin/js/bootstrap-scrollspy.js"></script>
	<!-- library for creating tabs -->
	<script src="http://www.shantanutextiles.in/admin/js/bootstrap-tab.js"></script>
	<!-- library for advanced tooltip -->
	<script src="http://www.shantanutextiles.in/admin/js/bootstrap-tooltip.js"></script>
	<!-- popover effect library -->
	<script src="http://www.shantanutextiles.in/admin/js/bootstrap-popover.js"></script>
	<!-- button enhancer library -->
	<script src="http://www.shantanutextiles.in/admin/js/bootstrap-button.js"></script>
	<!-- accordion library (optional, not used in demo) -->
	<script src="http://www.shantanutextiles.in/admin/js/bootstrap-collapse.js"></script>
	<!-- carousel slideshow library (optional, not used in demo) -->
	<script src="http://www.shantanutextiles.in/admin/js/bootstrap-carousel.js"></script>
	<!-- autocomplete library -->
	<script src="http://www.shantanutextiles.in/admin/js/bootstrap-typeahead.js"></script>
	<!-- tour library -->
	<script src="http://www.shantanutextiles.in/admin/js/bootstrap-tour.js"></script>
	<!-- library for cookie management -->
	<script src="http://www.shantanutextiles.in/admin/js/jquery.cookie.js"></script>
	<!-- calander plugin -->
	<script src='http://www.shantanutextiles.in/admin/js/fullcalendar.min.js'></script>
	<!-- data table plugin -->
	<script src='http://www.shantanutextiles.in/admin/js/jquery.dataTables.min.js'></script>

	<!-- chart libraries start -->
	<script src="http://www.shantanutextiles.in/admin/js/excanvas.js"></script>
	<script src="http://www.shantanutextiles.in/admin/js/jquery.flot.min.js"></script>
	<script src="http://www.shantanutextiles.in/admin/js/jquery.flot.pie.min.js"></script>
	<script src="http://www.shantanutextiles.in/admin/js/jquery.flot.stack.js"></script>
	<script src="http://www.shantanutextiles.in/admin/js/jquery.flot.resize.min.js"></script>
	<!-- chart libraries end -->

	<!-- select or dropdown enhancer -->
	<script src="http://www.shantanutextiles.in/admin/js/jquery.chosen.min.js"></script>
	<!-- checkbox, radio, and file input styler -->
	<script src="http://www.shantanutextiles.in/admin/js/jquery.uniform.min.js"></script>
	<!-- plugin for gallery image view -->
	<script src="http://www.shantanutextiles.in/admin/js/jquery.colorbox.min.js"></script>
	<!-- rich text editor library -->
	<script src="http://www.shantanutextiles.in/admin/js/jquery.cleditor.min.js"></script>
	<!-- notification plugin -->
	<script src="http://www.shantanutextiles.in/admin/js/jquery.noty.js"></script>
	<!-- file manager library -->
	<script src="http://www.shantanutextiles.in/admin/js/jquery.elfinder.min.js"></script>
	<!-- star rating plugin -->
	<script src="http://www.shantanutextiles.in/admin/js/jquery.raty.min.js"></script>
	<!-- for iOS style toggle switch -->
	<script src="http://www.shantanutextiles.in/admin/js/jquery.iphone.toggle.js"></script>
	<!-- autogrowing textarea plugin -->
	<script src="http://www.shantanutextiles.in/admin/js/jquery.autogrow-textarea.js"></script>
	<!-- multiple file upload plugin -->
	<script src="http://www.shantanutextiles.in/admin/js/jquery.uploadify-3.1.min.js"></script>
	<!-- history.js for cross-browser state change on ajax -->
	<script src="http://www.shantanutextiles.in/admin/js/jquery.history.js"></script>
	<!-- application script for Charisma demo -->
	<script src="http://www.shantanutextiles.in/admin/js/charisma.js"></script>
	
		
</body>
</html>
<?php ob_end_flush(); ?>