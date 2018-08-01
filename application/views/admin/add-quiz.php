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
                               <input type="text" placeholder="Answers" name="show_answers[]" class="form-control">
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
                                    <input type="text" placeholder="Correct Answer" name="correct_answer" class="form-control" required>
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