<!DOCTYPE html>
<?php 
if (empty($_SESSION['username']) && !isset($_SESSION['username'])) {
    redirect('/admin/index');
}
?>
<html lang="en">

<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
   <meta name="description" content="Admin Panel">
   <title>Cough Buster | Admin panel</title>
   <!-- =============== VENDOR STYLES ===============-->
   <!-- FONT AWESOME-->
   <link rel="stylesheet" href="<?= site_url('vendor/fontawesome/css/font-awesome.min.css') ?>">
   <link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css?family=Tangerine">
   <!-- SIMPLE LINE ICONS-->
   <link rel="stylesheet" href="<?= site_url('vendor/simple-line-icons/css/simple-line-icons.css') ?>">
   <!-- ANIMATE.CSS-->
   <link rel="stylesheet" href="<?= site_url('vendor/animate.css/animate.min.css') ?>">
   <!-- WHIRL (spinners)-->
   <link rel="stylesheet" href="<?= site_url('vendor/whirl/dist/whirl.css') ?>">
   <!-- =============== PAGE VENDOR STYLES ===============-->
   <!-- DATATABLES-->
   <link rel="stylesheet" href="<?= site_url('vendor/datatables-colvis/css/dataTables.colVis.css') ?>">
   <link rel="stylesheet" href="<?= site_url('vendor/datatable-bootstrap/css/dataTables.bootstrap.css') ?>">
   <!-- =============== BOOTSTRAP STYLES ===============-->
   <link rel="stylesheet" href="<?= site_url('css/bootstrap.css') ?>" id="bscss">
   <!-- =============== APP STYLES ===============-->
   <!-- TAGS INPUT-->
   <link rel="stylesheet" href="<?= site_url('vendor/bootstrap-tagsinput/dist/bootstrap-tagsinput.css') ?>">
   <!-- SLIDER CTRL-->
   <link rel="stylesheet" href="<?= site_url('vendor/seiyria-bootstrap-slider/dist/css/bootstrap-slider.min.css') ?>">
   <!-- CHOSEN-->
   <link rel="stylesheet" href="<?= site_url('vendor/chosen_v1.2.0/chosen.min.css') ?>">
   <!-- DATETIMEPICKER-->
   <link rel="stylesheet" href="<?= site_url('vendor/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css') ?>">
   <link rel="stylesheet" href="<?= site_url('css/app.css') ?>" id="maincss">
   <link rel="stylesheet" href="<?= site_url('css/style.css') ?>">
   <link href="<?= site_url('css/charisma-app.css') ?>" rel="stylesheet">
   <link rel="stylesheet" href="<?= site_url('css/style1.css') ?>">
   <link rel="stylesheet" type="text/css" href="<?= site_url('css/jquery.tagsinput.css') ?>" />
   
	<script type="text/javascript" src="<?= site_url('ckfinder/ckfinder.js') ?>"></script>
	<script type="text/javascript" src="<?= site_url('ckfinder/ckeditor/ckeditor.js') ?>"></script>
	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<script type="text/javascript">

function BrowseServer( startupPath, functionData )
{
	// You can use the "CKFinder" class to render CKFinder in a page:
	var finder = new CKFinder();

	// The path for the installation of CKFinder (default = "/ckfinder/").
	finder.basePath = '<?= site_url("ckfinder") ?>';

	//Startup path in a form: "Type:/path/to/directory/"
	finder.startupPath = startupPath;

	// Name of a function which is called when a file is selected in CKFinder.
	finder.selectActionFunction = SetFileField;

	// Additional data to be passed to the selectActionFunction in a second argument.
	// We'll use this feature to pass the Id of a field that will be updated.
	finder.selectActionData = functionData;

	// Name of a function which is called when a thumbnail is selected in CKFinder.
	finder.selectThumbnailActionFunction = ShowThumbnails;

	// Launch CKFinder
	finder.popup();
}

// This is a sample function which is called when a file is selected in CKFinder.
function SetFileField( fileUrl, data )
{
	document.getElementById( data["selectActionData"] ).value = fileUrl;
}

// This is a sample function which is called when a thumbnail is selected in CKFinder.
function ShowThumbnails( fileUrl, data )
{
	// this = CKFinderAPI
	var sFileName = this.getSelectedFile().name;
	document.getElementById( 'thumbnails' ).innerHTML +=
			'<div class="thumb">' +
				'<img src="' + fileUrl + '" />' +
				'<div class="caption">' +
					'<a href="' + data["fileUrl"] + '" target="_blank">' + sFileName + '</a> (' + data["fileSize"] + 'KB)' +
				'</div>' +
			'</div>';

	document.getElementById( 'preview' ).style.display = "";
	// It is not required to return any value.
	// When false is returned, CKFinder will not close automatically.
	return false;
}
	</script>
</head>

<body >
   <div class="wrapper">
      <!-- top navbar-->
      <header class="topnavbar-wrapper">
         <!-- START Top Navbar-->
         <nav role="navigation" class="navbar topnavbar">
            <!-- START navbar header-->
            <div class="navbar-header">
               <a href="#/" class="navbar-brand">
                  <div class="brand-logo fCWht">
						 Cough Buster Admin Panel
                  </div>
                  <div class="brand-logo-collapsed fCWht">
                     CMS Panel
                  </div>
               </a>
            </div>
            <!-- END navbar header-->
            <!-- START Nav wrapper-->
            <div class="nav-wrapper">
               <!-- START Left navbar-->
               <ul class="nav navbar-nav">
                  <li>
                   
                     <!-- Button to show/hide the sidebar on mobile. Visible on mobile only.-->
                     <a href="#" data-toggle-state="aside-toggled" data-no-persist="true" class="visible-xs sidebar-toggle "  onclick="slideport()">
                        <em class="fa fa-navicon"></em>
                     </a>
                  </li>
                  <!-- START User avatar toggle-->
                  <li>
                     <!-- Button used to collapse the left sidebar. Only visible on tablet and desktops-->
                     <a id="user-block-toggle" href="#user-block" data-toggle="collapse">
                        <em class="icon-user"></em>
                     </a>
                  </li>
                  <!-- END User avatar toggle-->
                  <!-- START lock screen-->
                  <li>
                     <a href="<?= site_url('Admin/logout') ?>" title="Logout ">
                        <em class="icon-lock"></em>
                     </a>
                  </li>
                  <!-- END lock screen-->
               </ul>
               <!-- END Left navbar-->
               
            </div>
            <!-- END Nav wrapper-->
            <!-- START Search form-->
            <form role="search" action="#" class="navbar-form">
               <div class="form-group has-feedback">
                  <input type="text" placeholder="Type and hit enter ..." class="form-control">
                  <div data-search-dismiss="" class="fa fa-times form-control-feedback"></div>
               </div>
               <button type="submit" class="hidden btn btn-default">Submit</button>
            </form>
            <!-- END Search form-->
         </nav>
         <!-- END Top Navbar-->
      </header>
      <!-- sidebar-->
      <aside class="aside">
         <!-- START Sidebar (left)-->
         <div class="aside-inner">
            <nav data-sidebar-anyclick-close="" class="sidebar">
               <!-- START sidebar nav-->
               <ul class="nav">
                  <!-- START user info-->
                  <li class="has-user-block">
                     <div id="user-block" class="collapse">
                        <div class="item user-block">
                           <!-- Name and Job-->
                           <b><?php echo $_SESSION['username'];  ?></b>
                           <div class="user-block-info">
                              <span class="user-block-name">
								</span>
                              <span class="user-block-role"> </span>
                           </div>
                        </div>
                     </div>
                  </li>
                  <!-- END user info-->
                  <!-- Iterates over all sidebar items-->
				  
				    <li class=" ">
                  <a href="<?= site_url('Admin/dashboard') ?>" title="Dashboard">
                     <em class="icon-grid"></em>
                     <span data-localize="sidebar.nav.DASHBOARD">Dashboard</span>
                  </a>    
               </li>

                <li class=" ">
                  <a href="#content" title="content" data-toggle="collapse">
                     <em class="icon-grid"></em>
					
                     <span data-localize="sidebar.nav.DASHBOARD">Website management </span>
                  </a>
                  <ul id="content" class="nav sidebar-subnav collapse">
                     <li class="sidebar-subnav-header"> Website management</li>
                     <li class=" ">
                        <a href="<?= site_url('Admin/website_content/') ?>" title="Content Pages">
                         <span data-localize="sidebar.nav.DASHBOARD">Content Pages</span>
                        </a>
                     </li>
   						<li class=" ">
   						 <a href="<?= site_url('Admin/settings/') ?>" title="Global Settings">
   							<span data-localize="sidebar.nav.DASHBOARD">Global Settings</span>
   						 </a>
   					   </li>
				      </ul>
                </li>
           			<li class=" ">
                        <a href="<?= site_url('Admin/users') ?>" title="Users" >
                           <em class="icon-grid"></em>
                           <span data-localize="sidebar.nav.DASHBOARD">Users</span>
                        </a>
                  </li>
               </ul>
               <!-- END sidebar nav-->
            </nav>
         </div>
         <!-- END Sidebar (left)-->
      </aside>