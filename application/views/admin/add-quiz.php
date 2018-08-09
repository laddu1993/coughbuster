<section>

<div class="content-wrapper">
    <div class="content-heading">Add Quiz</div>
    <form class="panel" method="post" action="<?= site_url('Admin/add_quiz') ?>" name="addpage_form" enctype="multipart/form-data">
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
                                    <option value="AUDIO">AUDIO</option>
                                    <option value="VIDEO">VIDEO</option>
                               </select>
                            </div>
                         </div>
                      </fieldset>

                      <fieldset>
                          <div class="form-group">
                            <label class="col-md-2 control-label" for="ProductThumb">Browse File:</label>
                              <div class="col-md-6">
                                <input type="file"  id="file_url" name="file_url" class="form-control" >
                              </div>
                          </div>
                    </fieldset>

                    <fieldset>
                         <div class="form-group">
                            <label class="col-md-2 control-label">Question:</label>
                            <div class="col-md-10">
                               <input type="text" placeholder="Question" name="question" class="form-control">
                            </div>
                         </div>
                    </fieldset>

                    <fieldset id="answers_add">
                         <div class="form-group">
                            <label class="col-md-2 control-label">Options of Answers 1:</label>
                            <div class="col-md-6">
                               <input type="text" placeholder="Answer1" name="show_answers[]" class="form-control" required>
                            </div>
                         </div>
                    </fieldset>
                    <fieldset>
                         <div class="form-group">
                            <label class="col-md-2 control-label">Options of Answers 2:</label>
                            <div class="col-md-6">
                               <input type="text" placeholder="Answer2" name="show_answers[]" class="form-control">
                            </div>
                         </div>
                    </fieldset>
                    <fieldset>
                         <div class="form-group">
                            <label class="col-md-2 control-label">Options of Answers 3:</label>
                            <div class="col-md-6">
                               <input type="text" placeholder="Answer3" name="show_answers[]" class="form-control">
                            </div>
                         </div>
                    </fieldset>
                    <fieldset>
                         <div class="form-group">
                            <label class="col-md-2 control-label">Options of Answers 4:</label>
                            <div class="col-md-6">
                               <input type="text" placeholder="Answer4" name="show_answers[]" class="form-control">
                            </div>
                         </div>
                    </fieldset>
                    <fieldset>
                         <div class="form-group">
                            <label class="col-md-2 control-label">Options of Answers 5:</label>
                            <div class="col-md-6">
                               <input type="text" placeholder="Answer5" name="show_answers[]" class="form-control">
                            </div>
                         </div>
                    </fieldset>
                    <fieldset>
                         <div class="form-group">
                            <label class="col-md-2 control-label">Options of Answers 6:</label>
                            <div class="col-md-6">
                               <input type="text" placeholder="Answer6" name="show_answers[]" class="form-control">
                            </div>
                         </div>
                    </fieldset>

                    <fieldset>
                         <div class="form-group">
                            <label class="col-md-2 control-label">Correct Answer:</label>
                            <div class="col-md-10">
                                <input type="text" placeholder="Correct Answer" name="correct_answer" class="form-control" required>
                            </div>
                         </div>
                    </fieldset>

                    <fieldset>
                         <div class="form-group">
                            <label class="col-md-2 control-label">Description :</label>
                            <div class="col-md-10">
                                <textarea class="form-control" name="description" ></textarea>
                            </div>
                         </div>
                    </fieldset>

                    <fieldset>
                         <div class="form-group">
                            <label class="col-md-2 control-label">Status:</label>
                            <div class="col-md-10">
                               <select name="status" class="form-control" required="">
                                    <option value="">SELECT</option>
                                    <option value="0" >Active</option>
                                    <option value="1">InActive</option>
                               </select>
                            </div>
                         </div>
                    </fieldset>

                </div>

              </div>
          </div>
       </div>
      <div class="text-right mt-lg">
          <input type="submit" class="btn btn-success" name="media" value="Save"/>
      </div>
    </form>
     </div>

</section>