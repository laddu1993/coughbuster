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
		<form action="functions/updatepage.php" method="POST" name="editpage_form">
          <div class="col-lg-7 col-sm-12 ">
             <div class="panel panel-default">
                <div class="panel-heading">
                    Content Pages  Details
                </div>
                <div class="panel-body">
					<fieldset>
					<input id="pageid" name="pageid" type="hidden" value="" >
						<label for="Pagename">Page Name  </label>
						<input id="Pagename" name="Pagename" type="text" value="" class="form-control required">
						<label for="PageTitle">Page Title</label>
						<input id="PageTitle" name="PageTitle" type="text" value=""  class="form-control required">
						<label for="ShortContent">Short Content</label>
						<textarea id="ShortContent" name="ShortContent" rows="5" cols="80" > </textarea>

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
						var editor = CKEDITOR.replace( 'ShortContent' );
						//editor.setData( '<p>Just click the <b>Image</b> or <b>Link</b> button, and then <b>&quot;Browse Server&quot;</b>.</p>' );

						// Just call CKFinder.setupCKEditor and pass the CKEditor instance as the first argument.
						// The second parameter (optional), is the path for the CKFinder installation (default = "/ckfinder/").
						CKFinder.setupCKEditor( editor, '../ckfinder/' ) ;

						// It is also possible to pass an object with selected CKFinder properties as a second argument.
						// CKFinder.setupCKEditor( editor, { basePath : '../', skin : 'v1' } ) ;
					}

							</script>
						<label for="Content"> Content</label>
						<textarea id="Content" name="Content" rows="10" cols="80" >  </textarea>

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
					<label for="wpstatus"> Status *</label>
					   
					</fieldset>
                   
					<input type="submit" class="mb-sm btn btn-primary"  value="Update " />  
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
							   <input id="Keywords" name="Keywords" type="text" value="" class="form-control ">
							   <label for="Descriptions">Descriptions</label>
								<input id="Descriptions" name="Descriptions" type="text" value="" class="form-control ">
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