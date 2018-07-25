<?php 

/**
* 
*/
class Admin extends CI_Controller
{
	
	function __construct(){
		parent::__construct();
    	$this->load->library('session');
    	$this->load->helper('url');
        $this->load->model('Admin_model', 'admin');
       // $this->load->library('logfile');
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

	function contact(){
		if (isset($_POST) && !empty($_POST)) {
			$data['contact_header'] = $this->input->post('contact_header');
			$data['contact_description'] = $this->input->post('contact_description');
			$id = $this->input->post('id');
			$update_c = $this->admin->update_about($id,$data);
			$b4_data = $this->admin->fetch_about();
			if (!empty($b4_data)) {
				$b4_data = $b4_data[0];
			}
			$user_id = $_SESSION['username'];
			$this->create_log_file($user_id,"Contact Section","Updated",$b4_data,$data);
			redirect('/admin/contact?status=1');
		}

		$data = current($this->admin->fetch_about());

		$this->load->view('admin/header');
		if (!empty($data)) {
			$this->load->view('admin/contact',$data);
		}else{
			$this->load->view('admin/contact');
		}
		$this->load->view('admin/footer');
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
			$data['md_user_id'] =  $mr_id;
			$insert_data = $this->admin->add_user('doctors',$data);
			redirect('Admin/view_all_doctors?id='.$mr_id);
		}
	}

	function view_all_doctors(){
		if (isset($_GET['id']) && !empty($_GET['id'])) {
			$whr = '(md_user_id = '.$_GET['id'].')';
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

	function update_user(){
		if (isset($_POST) && !empty($_POST)) {
			$data['Usr_Name'] = $this->input->post('Usr_Name');
			$data['Usr_Email'] = $this->input->post('Usr_Email');
			$data['Usr_Uname'] = $this->input->post('Usr_Uname');
			$data['Usr_Status'] = $this->input->post('Usr_Status');
			//$data['Usr_Level'] =  $this->input->post('Usr_Level');
			$password = $this->input->post('Usr_Password');
			$password = $this->passencrypt($password);
			$data['Usr_Password'] = $password;
			$id =  $this->input->post('Usr_Id');
			$b4_data = $this->admin->users_fetch($id);
			if (!empty($b4_data)) {
				$b4_data = $b4_data[0];
			}
			$update_data = $this->admin->update_user($id,$data);
			$user_id = $_SESSION['username'];
			$this->create_log_file($user_id,"User Section","Updated",$b4_data,$data);
			//echo "<pre>";print_r($update_data);die;
			redirect('/admin/add_edit?id='.$id.'&&status=1');
		}
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
			echo "Success";
		}
	}

	private function passencrypt($string)
	{
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

    private function passdecrypt($string)
	{
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
			$data['Wp_Content'] = $this->input->post('Wp_Content');
			$data['Wp_Key'] = $this->input->post('Wp_Key');
			$data['Wp_Des'] = $this->input->post('Wp_Des');
			date_default_timezone_set("Asia/Kolkata");
			$data['Wp_Last_UpdatedOn'] = date("Y-m-d H:i:sa");
			$id = $this->input->post('Wp_Id');
			$b4_data = $this->admin->website_content($id);
			if (!empty($b4_data)) {
				$b4_data = $b4_data[0];
			}
			$update_mentor = $this->admin->update_website_content($id,$data);
			redirect('/admin/website_content_edit?id='.$id.'&&status=1');
		}
	}

	function settings(){
		//echo "<pre>";print_r($_POST);die;
		if (isset($_POST) && !empty($_POST)) {
			$data['Ws_Name'] = $this->input->post('WebsiteName');
			$data['Ws_Title'] = $this->input->post('WebsiteTitle');
			$data['Ws_Email'] = $this->input->post('WebsiteEmail');
			$data['Ws_Phone'] = $this->input->post('WebsitePhone');
			$data['Ws_Mobile'] = $this->input->post('WebsiteMobile');
			$data['Ws_Logo'] = $this->input->post('WebsiteLogo');
			$data['Ws_Address'] = $this->input->post('address');
			$data['Ws_Des'] = $this->input->post('descriptn');
			$data['Ws_Key'] = $this->input->post('keywd');
			$data['Ws_Facebook'] = $this->input->post('Facebook');
			$data['Ws_Twitter'] = $this->input->post('Twitter');
			$data['Ws_LinkedIn'] = $this->input->post('LinkedIn');
			$data['Ws_GooglePlus'] = $this->input->post('GooglePlus');
			$data['Ws_Instagram'] = $this->input->post('Instagram');
			$data['Ws_Youtube'] = $this->input->post('Ws_Youtube');
			$data['Ws_Flicker'] = $this->input->post('Flicker');
			$data['Ws_Pin'] = $this->input->post('Pin');
			$data['Ws_GMap'] = $this->input->post('Google_Analytics');
			
			$id =  $this->input->post('id');
			if(!empty($id)){
			$b4_data = $this->admin->fetch_setting_details();
			if (!empty($b4_data)) {
				$b4_data = $b4_data[0];
			}
			$update_data = $this->admin->update_setting_details($id,$data);
			$user_id = $_SESSION['username'];
			$this->create_log_file($user_id,"Global Settings","Updated",$b4_data,$data);
			}else{
				$insert_data = $this->admin->insert_setting_details($data);
			}
		}

		$exist_id = $this->admin->fetch_setting_details();
		if (!empty($exist_id)) {
			$data = $exist_id[0];
		}

		$this->load->view('admin/header');
		if (!empty($data)) {
			$this->load->view('admin/settings',$data);
		}else{
			$this->load->view('admin/settings');
		}
		$this->load->view('admin/footer');
	}

	function export_data_apply(){
		$filename = "apply_form_details";
		$file_ending = "xls";
		$html .= "";
		$export_data = $this->admin->fetch_nomura_apply_form();
		//echo "<pre>";print_r($export_data);die;
		$html .= "<html><body><table><thead>
		<th>Sr No</th><th>FirstName</th><th>LastName</th><th>Designation</th><th>Phone Number</th><th>Email ID</th><th>Company Name</th><th>Company Website</th><th>Found Year</th><th>City Operator</th><th>Number of Employees</th><th>Number of Customers</th><th>Fund Round</th><th>Investors</th><th>Capability</th><th>Business Area</th><th>Company Profile</th><th>Found Team Profile</th><th>User Status</th></thead><tbody>
		";
		$i = 1;
		foreach ($export_data as  $value) {
			 $html .= "<tr>";
			 $html .="<td>".$i."</td>";
			 $html .="<td>".$value['firstname']."</td>";
			 $html .="<td>".$value['lastname']."</td>";
			 $html .="<td>".$value['designation']."</td>";
			 $html .="<td>".$value['phoneno']."</td>";
			 $html .="<td>".$value['email_id']."</td>";
			 $html .="<td>".$value['company_name']."</td>";
			 $html .="<td>".$value['company_website']."</td>";
			 $html .="<td>".$value['found_year']."</td>";
			 $html .="<td>".$value['city_operator']."</td>";
			 $html .="<td>".$value['no_employees']."</td>";
			 $html .="<td>".$value['no_customers']."</td>";
			 $html .="<td>".$value['found_round']."</td>";
			 $html .="<td>".$value['investors']."</td>";
			 $html .="<td>".$value['capability']."</td>";
			 $html .="<td>".$value['business_area']."</td>";
			 /*if (!empty($value['capability'])) {
			 	$capability = current($this->admin->fetch_capabilty($value['capability']));
			 	$capability_name = $capability['menu_name'];
			 }
			 $html .="<td>".$capability_name."</td>";
			 if (!empty($value['business_area'])) {
			 	$business_area = current($this->admin->fetch_business_area($value['business_area']));
			 	$business_area_name = $business_area['sub_menu'];
			 }
			 $html .="<td>".$business_area_name."</td>";*/
			 $html .="<td>".$value['company_profile']."</td>";
			 $html .="<td>".$value['found_team_profile']."</td>";
			 if ($value['is_checked'] == '0') {
			 	$is_checked = "User Accepted terms & Conditions";
			 	$html .= "<td>".$is_checked."</td>";
			 }else{
			 	$is_nchecked = "User Not Accepted terms & Conditions";
			 	$html .= "<td>".$is_nchecked."</td>";
			 }
			 $html .= "</tr>";
			 $i++;
		}

		$html .= "</table></body></html>";
		//echo "<pre>";print_r($html);die;
		$export_count = count($export_data);
		$filename = $filename.date("d_m_y_H_i_s").".xls";
		$filename = preg_replace('/\s+/', '_', $filename);
		$html = preg_replace('#(<br */?>\s*)+#i', ',', $html);
		header('Content-Description: File Transfer');
		header("Pragma: public");
		header("Cache-Control: private", false);
		header("Content-disposition: attachment; filename=".$filename);
		header("Content-type:text/xls");
		echo $html;
		exit();
	}


	function forgot_pswd(){
		//$this->load->view('admin/header');
		$this->load->library('email'); 

		if (isset($_POST['forgotpswd']) && !empty($_POST)) {
			$email = $this->input->post('email');

			$check_email = current($this->admin->check_emailid($email));
			//echo "<pre>";print_r($check_email);die;
			if (!empty($check_email)) {
				//$this->email->from($from_email, 'Nomura');
				$password = $this->passdecrypt($check_email['Usr_Password']);
		        $this->email->to($check_email['Usr_Email']);
		        $this->email->subject('Forgot Password');
		        $data .= "Hi ".$check_email['Usr_Name'].",
		        Your Username is : ".$check_email['Usr_Uname']." <br>
		        Your Password is : ".$password."
		        ";
		        $this->email->message($data);
		        if($this->email->send()){
		        	$status = "send";
		        }else{
		        	$status = "fail";
		        }
		        redirect('/admin/forgot_pswd?status='.$status.'');
			}else{
				$status = "not found";
				redirect('/admin/forgot_pswd?status='.$status.'');
			}
		}

		if (!empty($data)) {
			$this->load->view('admin/forgot-pswd',$data);
		}else{
			$this->load->view('admin/forgot-pswd');
		}
		$this->load->view('admin/footer');
	}

}

?>