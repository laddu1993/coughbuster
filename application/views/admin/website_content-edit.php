<!-- Main section-->
<section>
 <!-- Page content-->
 <div class="content-wrapper">
    <h3>Content pages
       <small>Get the list of all the Content Pages</small>
    </h3>
    <div class="container-fluid">
     	<?php if (isset($_GET['status']) && !empty($_GET['status'] == '1')) { ?>
          <div class="alert alert-success" id="notification">
             <strong>Successfully</strong> Updated Content page..!!
          </div>
          <br>
        <?php } ?>
       <!-- START DATATABLE 2 -->
       <div class="row">
		<form action="<?= site_url('Admin/update_website_content') ?>" method="POST" name="update_website_content">
          <div class="col-lg-7 col-sm-12 ">
             <div class="panel panel-default">
                <div class="panel-heading">
                    Content Pages  Details
                </div>
                <div class="panel-body">
					<fieldset>
					<input id="pageid" name="Wp_Id" type="hidden" value="<?php echo(isset($Wp_Id) ? $Wp_Id : ''); ?>" >
						<label for="Pagename">Page Name  </label>
						<input id="Pagename" name="Wp_Name" type="text" value="<?php echo(isset($Wp_Name) ? $Wp_Name : ''); ?>" class="form-control required">
						<label for="PageTitle">Page Title</label>
						<input id="PageTitle" name="Wp_Title" type="text" value="<?php echo(isset($Wp_Title) ? $Wp_Title : ''); ?>"  class="form-control required">
						
						<label for="Content"> Content</label>
						<textarea id="Content" name="Wp_Content" rows="10" cols="80" ><?php echo(isset($Wp_Content) ? $Wp_Content : ''); ?></textarea>

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
						var editor = CKEDITOR.replace( 'Content' );
						//editor.setData( '<p>Just click the <b>Image</b> or <b>Link</b> button, and then <b>&quot;Browse Server&quot;</b>.</p>' );

						// Just call CKFinder.setupCKEditor and pass the CKEditor instance as the first argument.
						// The second parameter (optional), is the path for the CKFinder installation (default = "/ckfinder/").
						CKFinder.setupCKEditor( editor, '../ckfinder/' ) ;

						// It is also possible to pass an object with selected CKFinder properties as a second argument.
						// CKFinder.setupCKEditor( editor, { basePath : '../', skin : 'v1' } ) ;
					}
					</script>
					
                   
					<input type="submit" class="mb-sm btn btn-primary" name="website_content" value="Update " />  
                </div>
             </div>
          </div>
          <div class="col-lg-5 col-sm-12 ">
             <div class="panel panel-default">
                <div class="panel-heading">
                    Content Pages SEO 
                </div>
                <div class="panel-body">
                   <div>
						<h4>SEO Details</h4>
						<fieldset>
						   <label for="Keywords">Keywords  </label>
						   <input id="Keywords" name="Wp_Key" type="text" value="<?php echo(isset($Wp_Key) ? $Wp_Key : ''); ?>" class="form-control">
						   <label for="Descriptions">Descriptions</label>
							<input id="Descriptions" name="Wp_Des" type="text" value="<?php echo(isset($Wp_Des) ? $Wp_Des : ''); ?>" class="form-control ">
						</fieldset>	
					</div>
                </div>
             </div>
          </div>
		  </form>
       </div>
       <!-- END DATATABLE 2 -->
      
    </div>
 </div>
   
</section>
<script type="text/javascript">
setTimeout(function() {
    $('#notification').fadeOut('fast');
}, 3000);
</script>