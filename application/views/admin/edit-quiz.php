<section>

<div class="content-wrapper">
    <div class="content-heading">Add Quiz</div>
    <form class="panel" method="post" action="<?= site_url('Admin/edit_quiz') ?>" name="addpage_form" enctype="multipart/form-data">
       <div role="tabpanel">
         
          <div class="tab-content">
             <div id="edit" role="tabpanel" class="tab-pane active">

                <div class="media_yes">
                      <fieldset>
                         <div class="form-group">
                            <label class="col-md-2 control-label">Type:</label>
                            <div class="col-md-10">
                               <select name="type" class="form-control">
                                    <option value="">SELECT</option>
                                    <?php if($type == 'AUDIO'){ ?>
                                    <option value="AUDIO" selected>AUDIO</option>
                                    <option value="VIDEO">VIDEO</option>
                                    <?php }else{ ?>
                                    <option value="AUDIO">AUDIO</option>
                                    <option value="VIDEO" selected>VIDEO</option>
                                    <?php } ?>
                               </select>
                            </div>
                         </div>
                      </fieldset>

                      <fieldset>
                          <div class="form-group">
                            <label class="col-md-2 control-label" for="ProductThumb">Browse File:</label>
                              <div class="col-md-6">
                                <input type="file"  id="file_url" name="file_url" class="form-control" >
                                <input type="hidden" name="url_file" value="<?php echo $file_url; ?>">
                              </div>
                              <div class="col-md-4"><?php if (!empty($file_url)) { $file_name =  explode("/", $file_url); echo $file_name[6]; }  ?></div>
                          </div>
                    </fieldset>

                    <fieldset>
                         <div class="form-group">
                            <label class="col-md-2 control-label">Question:</label>
                            <div class="col-md-10">
                               <input type="text" placeholder="Question" name="question" class="form-control" value="<?php echo $question; ?>">
                            </div>
                         </div>
                    </fieldset>
                    <?php if(!empty($show_answers)){ $show_answers = json_decode($show_answers); } ?>
                    <fieldset id="answers_add">
                         <div class="form-group">
                            <label class="col-md-2 control-label">Options of Answers 1:</label>
                            <div class="col-md-6">
                               <input type="text" placeholder="Answers" name="show_answers[]" class="form-control" value="<?php echo(!empty($show_answers[0]) ? $show_answers[0] : '')  ?>">
                            </div>
                         </div>
                    </fieldset>
                    <fieldset>
                         <div class="form-group">
                            <label class="col-md-2 control-label">Options of Answers 2:</label>
                            <div class="col-md-6">
                               <input type="text" placeholder="Answer2" name="show_answers[]" class="form-control" value="<?php echo(!empty($show_answers[1]) ? $show_answers[1] : '')  ?>">
                            </div>
                         </div>
                    </fieldset>
                    <fieldset>
                         <div class="form-group">
                            <label class="col-md-2 control-label">Options of Answers 3:</label>
                            <div class="col-md-6">
                               <input type="text" placeholder="Answer3" name="show_answers[]" class="form-control" value="<?php echo(!empty($show_answers[2]) ? $show_answers[2] : '')  ?>">
                            </div>
                         </div>
                    </fieldset>
                    <fieldset>
                         <div class="form-group">
                            <label class="col-md-2 control-label">Options of Answers 4:</label>
                            <div class="col-md-6">
                               <input type="text" placeholder="Answer4" name="show_answers[]" class="form-control" value="<?php echo(!empty($show_answers[3]) ? $show_answers[3] : '')  ?>">
                            </div>
                         </div>
                    </fieldset>
                    <fieldset>
                         <div class="form-group">
                            <label class="col-md-2 control-label">Options of Answers 5:</label>
                            <div class="col-md-6">
                               <input type="text" placeholder="Answer5" name="show_answers[]" class="form-control" value="<?php echo(!empty($show_answers[4]) ? $show_answers[4] : '')  ?>">
                            </div>
                         </div>
                    </fieldset>
                    <fieldset>
                         <div class="form-group">
                            <label class="col-md-2 control-label">Options of Answers 6:</label>
                            <div class="col-md-6">
                               <input type="text" placeholder="Answer6" name="show_answers[]" class="form-control" value="<?php echo(!empty($show_answers[5]) ? $show_answers[5] : '')  ?>">
                            </div>
                         </div>
                    </fieldset>


                    <fieldset>
                             <div class="form-group">
                                <label class="col-md-2 control-label">Correct Answer:</label>
                                <div class="col-md-10">
                                    <input type="text" placeholder="Correct Answer" name="correct_answer" class="form-control" value="<?php echo $correct_answer; ?>" required>
                                </div>
                             </div>
                    </fieldset>

                    <fieldset>
                         <div class="form-group">
                            <label class="col-md-2 control-label">Description :</label>
                            <div class="col-md-10">
                                <textarea class="form-control" name="description" ><?php echo $description; ?></textarea>
                            </div>
                         </div>
                    </fieldset>

                    <fieldset>
                         <div class="form-group">
                            <label class="col-md-2 control-label">Status:</label>
                            <div class="col-md-10">
                               <select name="status" class="form-control" required="">
                                    <option value="">SELECT</option>
                                    <?php if($status == 0){ ?>
                                    <option value="0" selected>Active</option>
                                    <option value="1">InActive</option>
                                    <?php }else{ ?>
                                    <option value="0">Active</option>
                                    <option value="1" selected>InActive</option>
                                    <?php } ?>
                               </select>
                            </div>
                         </div>
                    </fieldset>

                </div>

              </div>
          </div>
       </div>
      <div class="text-right mt-lg">
          <input type="hidden" name="quiz_id" value="<?php echo $id; ?>">
          <input type="submit" class="btn btn-success" name="media" value="Update">
      </div>
    </form>
     </div>

</section>