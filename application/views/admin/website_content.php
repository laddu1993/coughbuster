<!-- Main section-->
<section>
 <!-- Page content-->
 <div class="content-wrapper">
    <h3>Content pages
       <small>Get the list of all the Content Pages</small>
    </h3>
    <div class="container-fluid">
     
       <!-- START DATATABLE 2 -->
       <div class="row">
          <div class="col-lg-12">
             <div class="panel panel-default">
                <div class="panel-heading">
                    Content Pages |
                   <small>All  Content Pages</small>
                </div>
                <div class="panel-body">
                   <table id="datatable2" class="table table-striped table-hover">
                      <thead>
                         <tr>
                            <th> Sr. No.</th>
                            <th>Page Name</th>
                            <th>Modified On</th>
                            <th class="no-sort">Actions</th>
                         </tr>
                      </thead>
					  
                      <tbody>
                      <?php if (isset($website_content) && !empty($website_content)) {
                      	$i =1;
                      	foreach ($website_content as $value) {  ?>
					  <tr>
							<td><?php echo $i; ?></td>
							<td><?php echo $value['Wp_Name']; ?></td>
							<td><?php echo $value['Wp_Last_UpdatedOn']; ?></td>
						<td>
							<div class="btn-group mb-sm">
							   <button type="button" data-toggle="dropdown" class="btn dropdown-toggle btn-success">Action
								  <span class="caret"></span>
							   </button>
							   <ul role="menu" class="dropdown-menu">
								  <li><a href="<?= site_url('Admin/website_content_edit?id='.$value['Wp_Id'].'') ?>" >Edit</a>
								  </li>
							   </ul>
							</div>
						</td> 
					</tr>
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