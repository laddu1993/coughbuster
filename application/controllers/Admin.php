<?php 

/**
 *
 * @package    Admin
 * @author     Vinil Lakkavatri (vinil.lakkavatri@icloud.com)
 * @copyright  2017 Vinil Lakkavatri
 * @ci_version 3.1.2 echo CI_VERSION;
 * @deprecated File deprecated in Release 2.0.0
 *
 **/
class Admin extends CI_Controller
{
	
	function __construct(){
		error_reporting(0);
		parent::__construct();
    	$this->load->library('session');
    	$this->load->helper('url');
        $this->load->model('Admin_model', 'admin');
        $this->user_id = $this->session->userdata('user_id');
        if (!file_exists($_SERVER['DOCUMENT_ROOT']."/userfiles/doctors/".$this->user_id)) {
		    mkdir($_SERVER['DOCUMENT_ROOT']."/userfiles/doctors/".$this->user_id);
		    chmod($_SERVER['DOCUMENT_ROOT']."/userfiles/doctors/".$this->user_id, 0777);
		}
	}

	private function passencrypt($string){
	  $key = "a07d50fa47e3cfcad2a166929d680b45";
	  $result = "";
		  for($i=0; $i<strlen($string); $i++)
		  {
			$char = substr($string, $i, 1);
			$keychar = substr($key, ($i % strlen($key))-1, 1);
			$char = chr(ord($char)+ord($keychar));
			$result.=$char;
		  }
	  return strrev(str_replace("=","",base64_encode($result)));
	}

    private function passdecrypt($string){
		  $key = "a07d50fa47e3cfcad2a166929d680b45";
		  $result = "";
		  $string = base64_decode(strrev($string));

		  for($i=0; $i<strlen($string); $i++)
		  {
			$char = substr($string, $i, 1);
			$keychar = substr($key, ($i % strlen($key))-1, 1);
			$char = chr(ord($char)-ord($keychar));
			$result.=$char;
		  }
	  	return $result;
	}

	function index()
	{
		$this->load->view('admin/login');
		$this->load->view('admin/footer');
	}

	function dashboard(){
		//echo "<pre>";print_r($_SESSION);die;
		if (empty($_SESSION) && !isset($_SESSION)) {
			redirect('/admin/index');
		}
		$this->load->view('admin/header');
		$this->load->view('admin/dashboard');
		$this->load->view('admin/footer');
	}

	function login_check(){
		if (isset($_POST) && !empty($_POST)) {
			error_reporting(E_ALL);
			ini_set("display_errors", 1);
			$data['email'] = $this->input->post('email');
			$password = $this->input->post('password');
			$password = $this->passencrypt($password);
			$data['password'] = $password;
			$check_login = current($this->admin->check_login($data));
			//echo "<pre>";print_r($check_login);die;
			if (!empty($check_login)) {
				session_start();
				$this->session->set_userdata(array(
				    'username'  => $check_login['email_id'],
				    'user_id'  => $check_login['id'],
				    'mobile_no' => $check_login['mobile_no'],
				    'user_type'  => $check_login['user_type']
				));
				//echo "<pre>";print_r($_SESSION);die;
				redirect('Admin/dashboard');
			}else{
				redirect('Admin/index?status=fail');
			}
		}
	}

	function logout(){
		session_destroy();
		unset($_SESSION['username']);
		redirect('/admin');
	}

	function check_user_email_exists(){
		if (isset($_POST['reqtype']) && !empty($_POST['reqtype'] == 'doctor_validation')) {
			$mobile_no = $this->input->post('mobile_no');
			$whr = '(mobile_no = "'.$mobile_no.'")';
			$users_data = $this->admin->users_fetch('doctors',$whr);
			if (!empty($users_data)) {
				echo "Unauthorized";
			}else{
				echo "Success";
			}
		}elseif (isset($_POST['reqtype']) && !empty($_POST['reqtype'] == 'mr_validation')) {
			$mobile_no = $this->input->post('mobile_no');
			$whr = '(mobile_no = "'.$mobile_no.'")';
			$users_data = $this->admin->users_fetch('users',$whr);
			if (!empty($users_data)) {
				echo "Unauthorized";
			}else{
				echo "Success";
			}
		}
	}

	function adduser(){
		if (isset($_POST) && !empty($_POST)) {
			$data['name'] = $this->input->post('name');
			$data['gender'] = $this->input->post('gender');
			$data['dob'] = $this->input->post('dob');
			$data['place'] = $this->input->post('place');
			$data['tm_access_code'] = 'MR_'.rand();
			$data['user_type'] =  1;
			$data['email_id'] = $this->input->post('email_id');
			$data['mobile_no'] = $this->input->post('mobile_no');
			$password = $this->input->post('Usr_Password');
			$password = $this->passencrypt($password);
			$data['pass'] = $password;
			$data['added_by'] = $_SESSION['username'];
			$insert_data = $this->admin->add_user('users',$data);
			redirect('/admin/users');
		}
		if (empty($_POST)) {
			$this->load->view('admin/header');
			$this->load->view('admin/adduser');
			$this->load->view('admin/footer');
		}
		
	}

	function add_doctor(){
		if (isset($_POST) && !empty($_POST)) {
			//echo "<pre>";print_r($_POST);die;
			$data['name'] = $this->input->post('name');
			$data['gender'] = $this->input->post('gender');
			$data['dob'] = $this->input->post('dob');
			$data['place'] = $this->input->post('place');
			$data['tm_access_code'] = 'DR_'.rand();
			$data['email_id'] = $this->input->post('email_id');
			$data['mobile_no'] = $this->input->post('mobile_no');
			$password = $this->input->post('Usr_Password');
			$password = $this->passencrypt($password);
			$data['pass'] = $password;
			$data['added_by'] = $_SESSION['username'];
			$mr_id = $this->input->post('mr_id');
			$data['mr_user_id'] =  $mr_id;
			$insert_data = $this->admin->add_user('doctors',$data);
			redirect('Admin/view_all_doctors?id='.$mr_id);
		}
	}

	function view_all_doctors(){
		if (isset($_GET['id']) && !empty($_GET['id'])) {
			$whr = '(mr_user_id = '.$_GET['id'].')';
			$users_data = $this->admin->users_fetch('doctors',$whr);
			$data['users_data'] = $users_data;
		}
		//echo "<pre>";print_r($data);die;
		$this->load->view('admin/header');
		if (!empty($data)) {
			$this->load->view('admin/view-all-doctors',$data);
		}else{
			$this->load->view('admin/view-all-doctors');
		}
		$this->load->view('admin/footer');
	}

	function users(){
		$whr = '(user_type = 1)';
		$users_data = $this->admin->users_fetch('users',$whr);
		$data['users_data'] = $users_data;
		//echo "<pre>";print_r($data);die;
		$this->load->view('admin/header');
		if (!empty($data)) {
			$this->load->view('admin/user_register',$data);
		}else{
			$this->load->view('admin/user_register');
		}
		$this->load->view('admin/footer');
	}

	function add_edit(){
		if (isset($_GET) && !empty($_GET)) {
			$id = $_GET['id'];
			$data = current($this->admin->users_fetch($id));
			$password = $data['Usr_Password'];
			$password = $this->passdecrypt($password);
			$data['Usr_Password'] = $password;
		}
		//echo "<pre>";print_r($data);die;
		$this->load->view('admin/header');
		if (!empty($data)) {
			$this->load->view('admin/user-edit',$data);
		}else{
			$this->load->view('admin/user-edit');
		}
		$this->load->view('admin/footer');
	}



	function add_delete(){
		if (isset($_POST['reqtype']) && !empty($_POST['reqtype'] == 'doctor_user')) {
			$id = $_POST['doctor_id'];
			$whr = '(id = '.$id.')';
			$users_del = $this->admin->users_delete('doctors',$whr);
			echo "Success";
		}else if (isset($_POST['reqtype']) && !empty($_POST['reqtype'] == 'mr_user')) {
			$id = $_POST['mr_id'];
			$whr = '(id = '.$id.')';
			$users_del = $this->admin->users_delete('users',$whr);
			$whr_in = '(mr_id = '.$id.')';
			$users_del = $this->admin->users_delete('doctors',$whr);
			echo "Success";
		}
	}

	function website_content(){
		$website_content = $this->admin->website_content();
		$data['website_content'] = $website_content;

		$this->load->view('admin/header');
		if (!empty($data)) {
			$this->load->view('admin/website_content',$data);
		}else{
			$this->load->view('admin/website_content');
		}
		$this->load->view('admin/footer');
	}

	function website_content_edit(){
		if (isset($_GET) && !empty($_GET)) {
			$id = $_GET['id'];
			$data = current($this->admin->website_content($id));
		}
		$this->load->view('admin/header');
		if (!empty($data)) {
			$this->load->view('admin/website_content-edit',$data);
		}else{
			$this->load->view('admin/website_content-edit');
		}
		$this->load->view('admin/footer');
	}

	function update_website_content(){
		if (isset($_POST['website_content']) && !empty($_POST)) {
			$data['Wp_Name'] = $this->input->post('Wp_Name');
			$data['Wp_Title'] = $this->input->post('Wp_Title');
			$data['Wp_Content'] = strip_tags($this->input->post('Wp_Content'));
			$data['Wp_Content'] = preg_replace("/\s|&nbsp;/",' ',$data['Wp_Content']);
			$data['Wp_Key'] = $this->input->post('Wp_Key');
			$data['Wp_Des'] = $this->input->post('Wp_Des');
			date_default_timezone_set("Asia/Kolkata");
			$data['Wp_Last_UpdatedOn'] = date("Y-m-d H:i:sa");
			$id = $this->input->post('Wp_Id');
			//echo "<pre>";print_r($data);die;
			$update_mentor = $this->admin->update_website_content($id,$data);
			redirect('/admin/website_content_edit?id='.$id.'&&status=1');
		}
	}

	function quiz(){
		$data['quiz'] = $this->admin->fetch_user_exists('quiz');
		$this->load->view('admin/header');
		if (!empty($data)) {
			$this->load->view('admin/quiz',$data);
		}else{
			$this->load->view('admin/quiz');
		}
		$this->load->view('admin/footer');
	}

	function add_quiz(){
		if (isset($_POST) && !empty($_POST) || isset($_FILES['file_url']) && !empty($_FILES['file_url'])) {
			if (isset($_FILES['file_url']['name']) && !empty($_FILES['file_url']['name'])) {
				$image_name = $_FILES['file_url']['name'];
			    $tmp_image_name = $_FILES['file_url']['tmp_name'];
			    $image_type = $_FILES['file_url']['type'];
			    $image_size = $_FILES['file_url']['size'];
			    $status = move_uploaded_file($tmp_image_name, $_SERVER['DOCUMENT_ROOT']."/userfiles/doctors/".$this->user_id."/".$image_name);
			    $data['file_url'] = (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]/userfiles/doctors/".$this->user_id."/".$image_name;
			}
			$data['quiz_id'] = rand();
			$data['type'] = $this->input->post('type');
			$data['question'] = $this->input->post('question');
			$data['show_answers'] = json_encode($this->input->post('show_answers'));
			$data['correct_answer'] = $this->input->post('correct_answer');
			$data['description'] = $this->input->post('description');
			$data['status'] = $this->input->post('status');
			$insert_data = $this->admin->add_user('quiz',$data);
			$this->session->set_flashdata('message', 'Successfully Added!');
			redirect('Admin/quiz');
		}
		$this->load->view('admin/header');
		if (!empty($data)) {
			$this->load->view('admin/add-quiz',$data);
		}else{
			$this->load->view('admin/add-quiz');
		}
		$this->load->view('admin/footer');
	}

	function edit_quiz(){
		$id = $this->uri->segment(3);
		if (!empty($id)) {
			$data = current($this->admin->users_fetch('quiz','id = '.$id.''));
		}
		if (isset($_POST) && !empty($_POST) || isset($_FILES['file_url']) && !empty($_FILES['file_url'])) {
			if (isset($_FILES['file_url']['name']) && !empty($_FILES['file_url']['name'])) {
				$image_name = $_FILES['file_url']['name'];
			    $tmp_image_name = $_FILES['file_url']['tmp_name'];
			    $image_type = $_FILES['file_url']['type'];
			    $image_size = $_FILES['file_url']['size'];
			    $status = move_uploaded_file($image_name, $_SERVER['DOCUMENT_ROOT']."/userfiles/doctors/".$this->user_id."/".$image_name);
			    $data['file_url'] = (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]/userfiles/doctors/".$this->user_id."/".$image_name;
			}else{
				$data['file_url'] = $this->input->post('url_file');
			}
			$data['type'] = $this->input->post('type');
			$data['question'] = $this->input->post('question');
			$data['show_answers'] = json_encode($this->input->post('show_answers'));
			$data['correct_answer'] = $this->input->post('correct_answer');
			$data['description'] = $this->input->post('description');
			$data['status'] = $this->input->post('status');
			$quiz_id =  $this->input->post('quiz_id');
			$whr = 'id = '.$quiz_id.'';
			$update_mentor = $this->admin->update_into_table('quiz',$whr, $data);
			$this->session->set_flashdata('message', 'Successfully Updated!');
			redirect('Admin/edit_quiz/'.$quiz_id);
		}
		$this->load->view('admin/header');
		if (!empty($data)) {
			$this->load->view('admin/edit-quiz',$data);
		}else{
			$this->load->view('admin/edit-quiz');
		}
		$this->load->view('admin/footer');
	}

	function delete_quiz(){
		if (isset($_POST['reqtype']) && !empty($_POST['reqtype'] == 'delete_quiz')) {
			$id = $_POST['quiz_id'];
			$whr = '(id = '.$id.')';
			$delete_quiz = $this->admin->users_delete('quiz',$whr);
			echo "Success";
		}
	}

	function reports(){
		error_reporting(0);
		$data['reports'] = $this->admin->fetch_reports();
		//echo "<pre>";print_r($data);die;
		$this->load->view('admin/header');
		if (!empty($data)) {
			$this->load->view('admin/reports',$data);
		}else{
			$this->load->view('admin/reports');
		}
		$this->load->view('admin/footer');
	}


}

?>