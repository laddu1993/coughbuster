<?php 
error_reporting(0);
$mr_id = $_GET['mr_id'];
?>
<section>
   <!-- Page content-->
   <div class="content-wrapper">
      <div class="content-heading">Create AdminPanel User</div>
      <?php if(!empty($mr_id)){ ?>
         <form action="<?= site_url('Admin/add_doctor') ?>" name="add_doctor" method="post">
            <input type="hidden" name="mr_id" value="<?php echo $mr_id; ?>">
      <?php }else{ ?>
         <form action="<?= site_url('Admin/adduser') ?>" name="add_user" method="post">
      <?php } ?>
         <div role="tabpanel">
            <div class="tab-content">
               <div id="Account" role="tabpanel" class="tab-pane active">
                  
            <fieldset>
               <div class="form-group">
                  <label class="col-md-2 control-label" for="userName">Email ID *</label>
                  <div class="col-md-10">
                     <input id="email_id" name="email_id" type="text" class="form-control">
                     <span id="email_errmsg"></span>
                  </div>
               </div>
            </fieldset>
            <fieldset>
               <div class="form-group" >
                  <label class="col-md-2 control-label">Password *</label>
                <div class="col-md-10">
                     <input id="Usr_Password" name="Usr_Password" type="password" class="form-control required">
                     <span id="password_errmsg"></span>
                  </div>
               </div>
            </fieldset>
      
            <fieldset>
               <div class="form-group">
                  <label class="col-md-2 control-label" for="confirmpwd">Name *</label>
                  <div class="col-md-10">
                     <input id="name" name="name" type="text" class="form-control required">
                     <span id="errmsg"></span>
                  </div>
               </div>
            </fieldset>

            <fieldset>
               <div class="form-group">
                  <label class="col-md-2 control-label" for="confirmpwd">Gender *</label>
                  <div class="col-md-10">
                     <input id="gender" name="gender" type="radio" class="" value="MALE" >MALE &nbsp;&nbsp;&nbsp;
                     <input id="gender" name="gender" type="radio" class="" value="FEMALE" >FEMALE
                  </div>
               </div>
            </fieldset>

            <fieldset>
               <div class="form-group">
                  <label class="col-md-2 control-label" for="confirmpwd">Date Of Birth *</label>
                  <div class="col-md-10">
                     <input id="dob" name="dob" type="date" class="form-control required">
                     <span id="dob_errmsg"></span>
                  </div>
               </div>
            </fieldset>
            
            <fieldset>
               <div class="form-group">
         
                  <label class="col-md-2 control-label" for="ProductThumb">Mobile Number</label>
                  <div class="col-md-10">
                     <input input id="mobile_no" name="mobile_no" type="text" class="form-control required">
                     <span id="mobile_no_errmsg"></span>
                  </div>
                  
               </div>
            </fieldset>

            <fieldset>
               <div class="form-group">
         
                  <label class="col-md-2 control-label" for="ProductThumb">Place </label>
                  <div class="col-md-10">
                     <input input id="place" name="place" type="text" class="form-control required">
                     
                  </div>
                  
               </div>
            </fieldset>

            <fieldset>
               <div class="form-group">
                  <label class="col-md-2 control-label">User Status *</label>
                  <div class="col-md-10">
                     <select name="user_status" id="user_status" class=" form-control" >
                     <option> Select Status</option>
                     <option value="0" >Active</option>
                     <option value="1" >InActive</option>
                     </select>
                     <span id="user_status_errmsg"></span>
                  </div>
               </div>
            </fieldset>
               </div>
            </div>
         </div>
       <div class="text-right mt-lg">
         <a href="index.php" class="btn btn-warning">Refresh</a>
         <input type="submit" onclick="return regformhash(this.form, this.form.userName, this.form.email, this.form.password, this.form.confirmpwd, this.form.name);" class="btn btn-success" value="Save"/>
      </div>
      </form>
       </div>
</section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  
<script type="text/javascript">
var validateMobile = function(elementValue) {
    var mPattern = /^\d{10}$/;
    return mPattern.test(elementValue);
}
$('#mobile_no').keyup(function() {
    var value = $(this).val();
    var valid = validateMobile(value);
    if (!valid) {
        $(this).css('color', 'red');
        $('#mobile_no_errmsg').html("Please enter Vaild Mobile Number").show();
        $('#mobile_no_errmsg').css('color', 'red');

    }else{
        $.ajax({
           type: "POST",
                url: "<?= site_url('Admin/check_user_email_exists') ?>",
                async : false,
                <?php if(!empty($mr_id)){ ?>
                data:{'mobile_no':value,'reqtype':'doctor_validation'},
                <?php }else{ ?>
                data:{'mobile_no':value,'reqtype':'mr_validation'},
                <?php } ?>
                success : function(data){
                    if (data == 'Unauthorized') {
                        $(this).css('color', 'red');
                        $('#mobile_no_errmsg').html("Mobile Number is already exists. Please Choose another one").show();
                        $('#mobile_no_errmsg').css('color', 'red');
                    }else{
                        $('#mobile_no_address').css('color', '#000');
                        $("#mobile_no_errmsg").hide();
                    }
               }
        });
    }
});

$("form").submit(function( event ) {
      var email_address = $('#email_id').val();
      var name = $('#name').val();
      var Usr_Password = $('#Usr_Password').val();
      var dob = $('#dob').val();
      var mobile_no = $('#mobile_no').val();
      var user_status = $('#user_status').val();
      
      if (email_address == '') {
         $('#email_errmsg').css('color', 'red');
         $('#email_errmsg').html("Email ID is required").show();
         return false;
      }else{
         $('#email_errmsg').hide();
      }

      if (Usr_Password == '') {
         $('#password_errmsg').css('color', 'red');
         $('#password_errmsg').html("Password is required").show();
         return false;
      }else{
         $('#password_errmsg').hide();
      }

      if (name == '') {
         $('#errmsg').css('color', 'red');
         $('#errmsg').html("Name is required").show();
         return false;
      }else{
         $('#errmsg').hide();
      }

      if (dob == '') {
         $('#dob_errmsg').css('color', 'red');
         $('#dob_errmsg').html("Date Of Birth is required").show();
         return false;
      }else{
         $('#dob_errmsg').hide();
      }

      if (mobile_no == '') {
         $('#mobile_no_errmsg').css('color', 'red');
         $('#mobile_no_errmsg').html("Mobile Number is required").show();
         return false;
      }else if(mobile_no != ''){
         if($('#mobile_no_errmsg').css('display') == 'inline'){
            return false;
         }
      }else{
         $('#mobile_no_errmsg').hide();
      }

      if (user_status == 'Select Status') {
         $('#user_status_errmsg').css('color', 'red');
         $('#user_status_errmsg').html("User Status is required").show();
         return false;
      }else{
         $('#user_status_errmsg').hide();
      }
      
});
</script>