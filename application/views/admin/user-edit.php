<section>
   <!-- Page content-->
   <div class="content-wrapper">
      <div class="content-heading">Edit AdminPanel User</div>
      <form action="<?= site_url('Admin/update_user') ?>" name="update_user" method="post">
         <div role="tabpanel">
            <div class="tab-content">
               <?php if (isset($_GET['status']) && !empty($_GET['status']) == '1') { ?>
                <div class="alert alert-success" id="notification">
                   <strong>Successfully</strong> Updated User..!!
                </div>
                <br>
              <?php } ?>
                  <input type="hidden" name="Usr_Id" value="<?php echo(isset($Usr_Id) ? $Usr_Id : ''); ?>">
                  <fieldset>
                     <div class="form-group">
                        <label class="col-md-2 control-label" for="userName">User name *</label>
                        <div class="col-md-10">
                           <input id="Usr_Uname" name="Usr_Uname" value="<?php echo(isset($Usr_Name) ? $Usr_Name : ''); ?>" type="text" class="form-control">
                        </div>
                     </div>
                  </fieldset>
                  <fieldset>
                     <div class="form-group" >
                        <label class="col-md-2 control-label">Password *</label>
                      <div class="col-md-10">
                           <input id="Usr_Password" name="Usr_Password" value="<?php echo(isset($Usr_Password) ? $Usr_Password : ''); ?>" type="password" class="form-control required">
                        </div>
                     </div>
                  </fieldset>
            
                  <fieldset>
                     <div class="form-group">
                        <label class="col-md-2 control-label" for="confirmpwd">Name *</label>
                        <div class="col-md-10">
                       
                           <input id="Usr_Name" name="Usr_Name" value="<?php echo(isset($Usr_Name) ? $Usr_Name : ''); ?>" type="text" class="form-control required">
                        
                  
                        </div>
                     </div>
                  </fieldset>
                  
                  <fieldset>
                     <div class="form-group">
               
                        <label class="col-md-2 control-label" for="ProductThumb">Email</label>
                        <div class="col-md-10">
                           <input input id="Usr_Email" value="<?php echo(isset($Usr_Email) ? $Usr_Email : ''); ?>" name="Usr_Email" type="text" class="form-control required">
                   
                        </div>
                        
                     </div>
                  </fieldset>
              
                  <!-- <fieldset>
                     <div class="form-group">
                        <label class="col-md-2 control-label">User Level *</label>
                        <div class="col-md-10">
                           <select name="Usr_Level" id="Usr_Level" class="form-control" data-rel="chosen" >
                           <option value="">Select Level</option>
                           <option value="1" >1</option>
                           <option value="2" selected>2</option>
                           </select>
                        </div>
                     </div>
                  </fieldset> -->
                  <fieldset>
                     <div class="form-group">
                        <label class="col-md-2 control-label">User Status *</label>
                        <div class="col-md-10">
                           <select name="Usr_Status" id="Usr_Status" class=" form-control required" >
                           <?php if (isset($Usr_Status) && $Usr_Status == 1) { ?>
                           <option value="1" selected>Active</option>
                           <option value="0" >InActive</option>
                           <?php }else { ?>
                           <option value="0" selected>InActive</option>
                           <option value="1" >Active</option>
                           <?php } ?>
                           </select>
                        </div>
                     </div>
                  </fieldset>
         </div>
       <div class="text-right mt-lg">
         <a href="<?= site_url('Admin/dashboard') ?>" class="btn btn-warning">Refresh</a>
         <input type="submit" class="btn btn-success" value="Update"/>
      </div>
      </form>
       </div>
</section>
<script type="text/javascript">
setTimeout(function() {
    $('#notification').fadeOut('fast');
}, 3000);
</script>