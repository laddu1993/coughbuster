<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <meta name="description" content="pinkPitara Adminpanel">
   <title>Cough Buster | Admin Panel</title>
   <!-- =============== VENDOR STYLES ===============-->
   <!-- FONT AWESOME-->
   <link rel="stylesheet" href="<?= site_url('vendor/fontawesome/css/font-awesome.min.css') ?>">
   <!-- SIMPLE LINE ICONS-->
   <link rel="stylesheet" href="<?= site_url('vendor/simple-line-icons/css/simple-line-icons.css') ?>">
   <!-- =============== BOOTSTRAP STYLES ===============-->
   <link rel="stylesheet" href="<?= site_url('css/bootstrap.css') ?>" id="bscss">
   <!-- =============== APP STYLES ===============-->
   <link rel="stylesheet" href="<?= site_url('css/app.css') ?>" id="maincss">
   
   <link rel="stylesheet" href="<?= site_url('css/style.css') ?>" >
   
</head>

<body>
   <div class="wrapper">
      <div class="block-center mt-xl wd-xl">
         <!-- START panel-->
         <div class="panel panel-dark panel-flat">
            <div class="panel-heading text-center">
              <a href="javascript:void(0)" class="fS21 fCWht">
                  Cough Buster <br>
              Admin Panel
               </a>
            </div>
            <div class="panel-body">
               <p class="text-center pv">SIGN IN TO CONTINUE.</p>
               <?php
                  if (isset($_GET['status'])) {
                  echo '<p class="error tC">Error Logging In!</p> <br/>';
                  }
                  ?> 
               <form role="form" action="<?= site_url('Admin/login_check') ?>"  class="mb-lg" name="login_form" method="post">
                  <div class="form-group has-feedback">
                     <input name="email" id="email"  placeholder="Enter email" autocomplete="off" required class="form-control">
                     <span class="fa fa-envelope form-control-feedback text-muted"></span>
                  </div>
                  <div class="form-group has-feedback">
                     <input name="password" id="password"  type="password" placeholder="Password" required class="form-control">
                     <span class="fa fa-lock form-control-feedback text-muted"></span>
                  </div>
                  <div class="clearfix">
                     <div class="pull-right"><a href="<?= site_url('Admin/forgot_pswd') ?>" class="text-muted">Forgot your password?</a>
                     </div>
                  </div>
                  <input type="submit" class="btn btn-primary mt-lg" value="Login"/>
               </form>
              
            </div>
         </div>
         <!-- END panel-->
         <div class="p-lg text-center">
            <span>&copy;</span>
            <span>2018</span>
            <span>-</span>
            <span>Cough Buster</span>
         </div>
      </div>
   </div>
