<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<!-- Main section-->
<section>
   <!-- Page content-->
   <div class="content-wrapper">
      <div class="content-heading">
         <!-- END Language list    -->
         Reports
         <small data-localize="dashboard.WELCOME"></small>
      </div>
      <!-- START widgets box-->
      <div class="row">
         <table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>Sr No.</th>
                <th>Doctor Name</th>
                <th>TM Access Code</th>
                <th>Gender</th>
                <th>DOB</th>
                <th>Prescription</th>
                <th>Date</th>
            </tr>
        </thead>
        <tbody>
         <?php if(!empty($reports)){ $i =1; foreach ($reports as $value) { ?>
            <tr>
                <td><?php echo $i; ?></td>
                <td><?php echo $value['name']; ?></td>
                <td><?php echo $value['tm_access_code']; ?></td>
                <td><?php echo $value['gender']; ?></td>
                <td><?php echo $value['dob']; ?></td>
                <td><?php echo $value['prescription']; ?></td>
                <td><?php echo $value['added_date']; ?></td>
            </tr>
         <?php $i++; } } ?>
         </tbody>
      </table>
      </div>
   </div>
</section>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#example').DataTable();
} );
</script>