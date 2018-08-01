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

                    <fieldset id="answers_add">
                        <?php $show_answers = json_decode($show_answers); //$show_answers = array_reverse($show_answers); echo "<pre>";print_r($show_answers);
                         ?>
                         <?php if (!empty($show_answers[1])) { ?>
                          <fieldset id="answers_add1"><div class="form-group"><label class="col-md-2 control-label">Options of Answers 2:</label><div class="col-md-6"><input type="text" placeholder="Answers" name="show_answers[]" class="form-control" value="<?php echo(!empty($show_answers[1]) ? $show_answers[1] : '')  ?>"></div><div class="col-md-4"><span class="btn btn-success" id="add_one1" onclick="AddOneMore(this.id)">Add</span><input type="hidden" id="add_ans1" value="1"><span class="btn btn-danger" id="1" onclick="Remove(this.id)">Remove</span></div></div></fieldset>
                          <?php } ?>
                          <?php if (!empty($show_answers[2])) { ?>
                          <fieldset id="answers_add2"><div class="form-group"><label class="col-md-2 control-label">Options of Answers 3:</label><div class="col-md-6"><input type="text" placeholder="Answers" name="show_answers[]" class="form-control" value="<?php echo(!empty($show_answers[2]) ? $show_answers[2] : '')  ?>"></div><div class="col-md-4"><span class="btn btn-success" id="add_one2" onclick="AddOneMore(this.id)">Add</span><input type="hidden" id="add_ans2" value="2"><span class="btn btn-danger" id="2" onclick="Remove(this.id)">Remove</span></div></div></fieldset>
                          <?php } ?>
                          <?php if (!empty($show_answers[3])) { ?>
                          <fieldset id="answers_add3"><div class="form-group"><label class="col-md-2 control-label">Options of Answers 4:</label><div class="col-md-6"><input type="text" placeholder="Answers" name="show_answers[]" class="form-control" value="<?php echo(!empty($show_answers[3]) ? $show_answers[3] : '')  ?>"></div><div class="col-md-4"><span class="btn btn-success" id="add_one3" onclick="AddOneMore(this.id)">Add</span><input type="hidden" id="add_ans3" value="3"><span class="btn btn-danger" id="3" onclick="Remove(this.id)">Remove</span></div></div></fieldset>
                          <?php } ?>
                          <?php if (!empty($show_answers[4])) { ?>
                          <fieldset id="answers_add4"><div class="form-group"><label class="col-md-2 control-label">Options of Answers 5:</label><div class="col-md-6"><input type="text" placeholder="Answers" name="show_answers[]" class="form-control" value="<?php echo(!empty($show_answers[4]) ? $show_answers[4] : '')  ?>"></div><div class="col-md-4"><span class="btn btn-success" id="add_one4" onclick="AddOneMore(this.id)">Add</span><input type="hidden" id="add_ans4" value="4"><span class="btn btn-danger" id="4" onclick="Remove(this.id)">Remove</span></div></div></fieldset>
                          <?php } ?>
                         <div class="form-group">
                            <label class="col-md-2 control-label">Options of Answers 1:</label>
                            <div class="col-md-6">
                               <input type="text" placeholder="Answers" name="show_answers[]" class="form-control" value="<?php echo(!empty($show_answers[0]) ? $show_answers[0] : '')  ?>">
                            </div>
                            <div class="col-md-4">
                                <span class="btn btn-success" id="add_one" onclick="AddOneMore(this.id)">Add</span>
                                <input type="hidden" id="add_ans" value="1">
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
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
function AddOneMore(e){
  //console.log(curMaxInput);
  var add_ans = $('#add_ans').val();
  add = parseInt(add_ans)+1;
  length = $('#answers_add').children('fieldset').length;
  if (length < 4) {
    $('div #answers_add').prepend('<fieldset id="answers_add'+ add +'"><div class="form-group"><label class="col-md-2 control-label">Options of Answers '+ add +':</label><div class="col-md-6"><input type="text" placeholder="Answers" name="show_answers[]" class="form-control"></div><div class="col-md-4"><span class="btn btn-success" id="add_one" onclick="AddOneMore(this.id)">Add</span><input type="hidden" id="add_ans" value="'+ add +'"><span class="btn btn-danger" id="'+ add +'" onclick="Remove(this.id)">Remove</span></div></div></fieldset>');
  }
}

function Remove(e){
    $('#answers_add'+e).remove();
}
</script>