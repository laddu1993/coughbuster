<section>
 <!-- Page content-->
 <div class="content-wrapper">
    <div class="content-heading">Website Settings</div>
    <form class="panel" action="<?= site_url('Admin/settings') ?>" method="post">

       <div role="tabpanel">
          <ul class="nav nav-tabs nav-justified">
             <li role="presentation" class="active"><a href="#edit" aria-controls="edit" role="tab" data-toggle="tab">Website Description</a>
             </li>
             <li role="presentation"><a href="#seo" aria-controls="seo" role="tab" data-toggle="tab">Description for SEO</a>
             </li>
             <li role="presentation"><a href="#picture" aria-controls="picture" role="tab" data-toggle="tab">Social Links</a>
             </li>
			 <li role="api"><a href="#api" aria-controls="picture" role="tab" data-toggle="tab">Google Integration</a>
             </li>
			 <!--<li role="pay"><a href="#pay" aria-controls="picture" role="tab" data-toggle="tab">Payment Gateway</a>
             </li>
			 <li role="recaptcha"><a href="#recaptcha" aria-controls="picture" role="tab" data-toggle="tab">Recaptcha Details</a>
             </li>-->
          </ul>
          <div class="tab-content">
             <div id="edit" role="tabpanel" class="tab-pane active">
                <fieldset>
                   <div class="form-group">
                      <label class="col-md-2 control-label" for="WebsiteName">Website Name:</label>
                      <div class="col-md-10">
                         <input type="text" id="WebsiteName" name="WebsiteName" placeholder="Website name" value="<?php echo(isset($Ws_Name) ? $Ws_Name : ''); ?>" class="form-control required">
                      </div>
                   </div>
                </fieldset>
                <fieldset>
                   <div class="form-group">
                      <label class="col-md-2 control-label" for="WebsiteTitle">Website Title:</label>
                      <div class="col-md-10">
                         <input type="text" id="WebsiteTitle" name="WebsiteTitle" placeholder="Website title" value="<?php echo(isset($Ws_Title) ? $Ws_Title : ''); ?>"  class="form-control required">
                      </div>
                   </div>
                </fieldset>
                <fieldset>
                   <div class="form-group">
                      <label class="col-md-2 control-label" for="WebsiteEmail">Website Email:</label>
                      <div class="col-md-10">
                         <input type="text" id="WebsiteEmail" name="WebsiteEmail" value="<?php echo(isset($Ws_Email) ? $Ws_Email : ''); ?>" placeholder="infor@pinkpitarta.com" class="form-control required">
                      </div>
                   </div>
                </fieldset>
                <fieldset>
                   <div class="form-group">
                      <label class="col-md-2 control-label" for="WebsitePhone">Website Phone:</label>
                      <div class="col-md-10">
                         <input type="text" id="WebsitePhone" name="WebsitePhone" value="<?php echo(isset($Ws_Phone) ? $Ws_Phone : ''); ?>"  placeholder="1234567890"  class="form-control">
                      </div>
                   </div>
                </fieldset>
                <fieldset>
                   <div class="form-group">
                      <label class="col-md-2 control-label" for="WebsiteMobile">Website Mobile :</label>
                      <div class="col-md-10">
                         <input type="text"  id="WebsiteMobile" name="WebsiteMobile" value="<?php echo(isset($Ws_Mobile) ? $Ws_Mobile : ''); ?>" placeholder="1234567890" class="form-control">
                      </div>
                   </div>
                </fieldset>
                <fieldset>
                   <div class="form-group">
                      <label class="col-md-2 control-label" for="WebsiteLogo">Website Logo :</label>
                      <div class="col-md-6">
                         <input type="text"  id="WebsiteLogo" name="WebsiteLogo" value="<?php echo(isset($Ws_Logo) ? $Ws_Logo : ''); ?>" placeholder="" class="form-control">
						 
                      </div>
                      <div class="col-md-4">
                        <input type="button" value="Browse Server" onclick="BrowseServer( 'Images:/', 'WebsiteLogo' );" />
                      </div>
                   </div>
                </fieldset>
                <fieldset>
                   <div class="form-group">
                      <label class="col-md-2 control-label" for="address">Address</label>
                      <div class="col-md-10">
                         <textarea rows="5" id="address" name="address" placeholder="Max 255 characters..." class="form-control"><?php echo(isset($Ws_Address) ? $Ws_Address : ''); ?></textarea>
                      </div>
                   </div>
                </fieldset>
             </div>
             <div id="seo" role="tabpanel" class="tab-pane">
                <fieldset>
                   <div class="form-group">
                      <label class="col-md-2 control-label" for="descriptn">Description</label>
                      <div class="col-md-10">
                         <textarea rows="5" id="descriptn" name="descriptn" placeholder="Max 255 characters..." class="form-control"><?php echo(isset($Ws_Des) ? $Ws_Des : ''); ?></textarea>
                      </div>
                   </div>
                </fieldset>
                <fieldset>
                   <div class="form-group">
                      <label class="col-md-2 control-label" for="keywd">Keywords</label>
                      <div class="col-md-10">
                         <textarea rows="5" id="keywd" name="keywd" placeholder="Max 1000 characters..." class="form-control"><?php echo(isset($Ws_Key) ? $Ws_Key : ''); ?></textarea>
                      </div>
                   </div>
                </fieldset>
             </div>
             <div id="picture" role="tabpanel" class="tab-pane">
					<fieldset>
					   <div class="form-group">
						  <label class="col-md-2 control-label" for="Facebook">Facebook</label>
						  <div class="col-md-10">
							 <input type="text"  id="Facebook" name="Facebook" value="<?php echo(isset($Ws_Facebook) ? $Ws_Facebook : ''); ?>" placeholder="" class="form-control">
						  </div>
					   </div>
					</fieldset>
					<fieldset>
					   <div class="form-group">
						  <label class="col-md-2 control-label" for="Twitter">Twitter</label>
						  <div class="col-md-10">
							 <input type="text"  id="Twitter" name="Twitter" value="<?php echo(isset($Ws_Twitter) ? $Ws_Twitter : ''); ?>" placeholder="" class="form-control">
						  </div>
					   </div>
					</fieldset>
					<fieldset>
					   <div class="form-group">
						  <label class="col-md-2 control-label" for="LinkedIn">LinkedIn</label>
						  <div class="col-md-10">
							 <input type="text"  id="LinkedIn" name="LinkedIn" value="<?php echo(isset($Ws_LinkedIn) ? $Ws_LinkedIn : ''); ?>" placeholder="" class="form-control">
						  </div>
					   </div>
					</fieldset>
					<fieldset>
					   <div class="form-group">
						  <label class="col-md-2 control-label" for="GooglePlus">GooglePlus</label>
						  <div class="col-md-10">
							  <input type="text"  id="GooglePlus" name="GooglePlus" value="<?php echo(isset($Ws_GooglePlus) ? $Ws_GooglePlus : ''); ?>" placeholder="" class="form-control">
						  </div>
					   </div>
					</fieldset>
					<!-- <fieldset>
					   <div class="form-group">
						  <label class="col-md-2 control-label" for="GooglePlus">Instagram</label>
						  <div class="col-md-10">
							  <input type="text"  id="Instagram" name="Instagram" value="<?php //echo(isset($Ws_Instagram) ? $Ws_Instagram : ''); ?>" placeholder="" class="form-control">
						  </div>
					   </div>
					</fieldset> -->
					<fieldset>
					   <div class="form-group">
						  <label class="col-md-2 control-label" for="GooglePlus">You Tube</label>
						  <div class="col-md-10">
							  <input type="text"  id="Instagram" name="Ws_Youtube" value="<?php echo(isset($Ws_Youtube) ? $Ws_Youtube : ''); ?>" placeholder="" class="form-control">
						  </div>
					   </div>
					</fieldset>
             </div>
			 <div id="api" role="tabpanel" class="tab-pane">
					<fieldset>
					   <div class="form-group">
						  <label class="col-md-2 control-label" for="Zopim_Code">Google Analytics Code</label>
						  <div class="col-md-10">
							  <textarea rows="5" cols="100" id="Google_Analytics" name="Google_Analytics"><?php echo(isset($Ws_GMap) ? $Ws_GMap : ''); ?></textarea>
						  </div>
					   </div>
					</fieldset>
             </div>
			 <!-- <div id="pay" role="tabpanel" class="tab-pane">
					<fieldset>
					   <div class="form-group">
						  <label class="col-md-2 control-label" for="payment">Payment Gateway Name</label>
						  <div class="col-md-10">
							 <input type="text"  id="Payment_Name" name="Payment_Name" value="" placeholder="Payment Gateway Name" class="form-control">
						  </div>
					   </div>
					</fieldset>
					<fieldset>
					   <div class="form-group">
						  <label class="col-md-2 control-label" for="Payment_Link">Payment Gateway Link</label>
						  <div class="col-md-10">
							 <input type="text"  id="Payment_Link" name="Payment_Link" value="" placeholder="" class="form-control">
						  </div>
					   </div>
					</fieldset>
					
             </div> 
			 <div id="recaptcha" role="tabpanel" class="tab-pane">
					<fieldset>
					   <div class="form-group">
						  <label class="col-md-2 control-label" for="payment">Private Key</label>
						  <div class="col-md-10">
							 <input type="text"  id="Private_Key" name="Private_Key" value="" placeholder="Private Key for Recaptcha" class="form-control">
						  </div>
					   </div>
					</fieldset>
					<fieldset>
					   <div class="form-group">
						  <label class="col-md-2 control-label" for="Public_Key">Public Key</label>
						  <div class="col-md-10">
							 <input type="text"  id="Public_Key" name="Public_Key" value="" placeholder="Public Key for Recaptcha" class="form-control"/>
						  </div>
					   </div>
					</fieldset>
					
             </div> -->
          </div>
       </div>
	   
    <div class="text-right mt-lg">
    	<input type="hidden" name="id" value="<?php echo(isset($Ws_Id) ? $Ws_Id : ''); ?>">
       <a href="index.php" class="btn btn-warning">Refresh</a>
       	<?php if (empty($Ws_Id)) { ?>
		   <input type="submit" class="btn btn-success" value="Save"/>
		<?php }else{ ?>
		<input type="submit" class="btn btn-success" value="Update"/>
		<?php } ?>
    </div>
    </form>
 </div>
</section>