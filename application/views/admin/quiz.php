 <!-- Main section-->
<section>
   <!-- Page content-->
   <div class="content-wrapper">
      <h3>Admin Panel Quiz
         <small>Find all the list of Quiz</small>
      </h3>
      <div class="container-fluid">
       <a href="<?= site_url('Admin/add_quiz') ?>"><button class="btn btn-success"> Add Quiz </button></a> &nbsp;&nbsp;
         <!-- START DATATABLE 2 -->
         <div class="row">
	   	<div class="col-lg-12">
				 <div class="panel panel-default dN" id="update_form">
				   
				</div>
				 
			</div>
            <div class="col-lg-12">
               <div class="panel panel-default">
                  <div class="panel-heading">
                      Quiz |
                     <small>All Quiz</small>
                  </div>
                  <div class="panel-body">
                     <table id="datatable2" class="table table-striped table-hover">
                        <thead>
                           <tr>
                              <th>Sr No</th>
                              <th>Type</th>
                              <th class="sort-numeric">Question</th>
                              <th class="no-sort">Actions</th>
                           </tr>
                        </thead>
					     
                        <tbody>
				            <?php 
                        if (!empty($quiz)) {
                        $i = 1;
                        foreach ($quiz as $value) {  ?>
									  <tr>
										<td><?php echo $i; ?></td>
										<td><?php echo $value['type']; ?></td>
										<td><?php echo $value['question']; ?></td><td>
										<div class="btn-group mb-sm">
                                 <button type="button" data-toggle="dropdown" class="btn dropdown-toggle btn-success">Action
                                   <span class="caret"></span>
                                 </button>
										   <ul role="menu" class="dropdown-menu">
                                    <li><a class="edit" href="<?= site_url('Admin/edit_quiz/'.$value['id'].'') ?>">Edit</a></li> 
											  <li><a class="delete" href="#" onclick="return DeleteUser(<?php echo $value['id']; ?>);">Delete</a></li> 
										   </ul>
										</div>
								   <?php $i++; } } ?>
                        </tbody>
                     </table>
                  </div>
               </div>
            </div>
         </div>
         <!-- END DATATABLE 2 -->
      </div>
   </div>
</section>
<script type="text/javascript">
function DeleteUser(remove_user_id){
   var r = confirm("Are you sure you want delete question");
   if (r == true) {
      $.ajax({
         type: "POST",
         url: "<?= site_url('Admin/delete_quiz') ?>",
         async : false,
         data:{'quiz_id':remove_user_id ,'reqtype':'delete_quiz'},
         success : function(data){
               if (data != '') {
                  alert('Successfully Deleted User.!!');
                  location.reload(true);
               }
            }
      });
   }else{
      r = alert("You pressed Cancel!");
   }
}
</script>