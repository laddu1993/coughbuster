<?php 
/**
 *
 * @package    Coughbuster
 * @author     Vinil Lakkavatri (vinil.lakkavatri@icloud.com)
 * @copyright  2017 Vinil Lakkavatri
 * @ci_version 3.1.2 echo CI_VERSION;
 * @deprecated File deprecated in Release 2.0.0
 *
 **/
class Coughbuster extends CI_Controller
{
	
	function __construct(){
		parent::__construct();
        error_reporting(0);
        $this->load->model('Admin_model', 'admin');
        $this->load->helper('url');
        //$this->load->library('pushcert.pem');
      
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
	
	/* This function checks mobile number & password for mobile devices */
	function login_check(){
		$method = $_SERVER['REQUEST_METHOD'];
		if ($method == 'POST') {
			$user_data['tm_access_code'] = (isset($_GET['tm_access_code']) ? $_GET['tm_access_code'] : '');
			$pswd = (isset($_GET['pswd']) ? $_GET['pswd'] : '');
			$user_data['pass'] = $this->passencrypt($pswd);

			if(!empty($user_data['tm_access_code']) && !empty($user_data['pass'])){
				$whr = '(tm_access_code = '.$user_data['tm_access_code'].' AND pass ="'.$user_data['pass'].'" AND user_status = 0)';
				$p_data = current($this->admin->fetch_user_exists('users',$whr));
				if(!empty($p_data)){
					$p_data['pass'] = $this->passdecrypt($p_data['pass']);
					$data['status'] = array('code' => 200, 'message' => 'success', 'data' => $p_data);
				}else{
					$data['status'] = array('code' => 200, 'message' => 'No Record Found');
				}
			}else{
				$data['status'] = array('code' => 300, 'message' => 'Parameters are missing!');
			}
		
		}else{
			$data['status'] = array('code' => 404, 'message' => 'Bad Request');
		}
		echo json_encode($data);
	}

	function web_content(){
		$method = $_SERVER['REQUEST_METHOD'];
		if ($method == 'GET') {
			$Wp_Id = (isset($_GET['post_id']) ? $_GET['post_id'] : '');
			if(!empty($Wp_Id)){
				$whr = '(Wp_Id = '.$Wp_Id.')';
				$usna = $this->admin->fetch_user_exists('webpage',$whr);
				$data['status'] = array('code' => 200, 'message' => 'success' , 'data' => $usna);
			}else{
				$data['status'] = array('code' => 300, 'message' => 'Parameters are missing!');
			}
		}else{
			$data['status'] = array('code' => 404, 'message' => 'Bad Request');
		}
		echo json_encode($data);
	}

	function content_update(){
		$method = $_SERVER['REQUEST_METHOD'];
		if ($method == 'POST') {
			$Wp_Id = (isset($_GET['post_id']) ? $_GET['post_id'] : '');
			$user_data['Wp_Name'] = (isset($_GET['Wp_Name']) ? $_GET['Wp_Name'] : '');
			$user_data['Wp_Title'] = (isset($_GET['Wp_Title']) ? $_GET['Wp_Title'] : '');
			$user_data['Wp_Content'] = (isset($_GET['Wp_Content']) ? $_GET['Wp_Content'] : '');
			if(!empty($Wp_Id) && !empty($user_data['Wp_Content'])){
				$whr = '(Wp_Id = '.$Wp_Id.')';
				$usna = $this->admin->update_into_table('webpage',$whr,$user_data);
				$data['status'] = array('code' => 200, 'message' => 'success');
			}else{
				$data['status'] = array('code' => 300, 'message' => 'Parameters are missing!');
			}
		}else{
			$data['status'] = array('code' => 404, 'message' => 'Bad Request');
		}
		echo json_encode($data);
	}

	function doctor_login_check(){
		$method = $_SERVER['REQUEST_METHOD'];
		if ($method == 'POST') {
			$user_data['tm_access_code'] = (isset($_GET['tm_access_code']) ? $_GET['tm_access_code'] : '');
			$user_data['mobile_no'] = (isset($_GET['mobile_number']) ? $_GET['mobile_number'] : '');
			$pass = (isset($_GET['pswd']) ? $_GET['pswd'] : '');
			$user_data['pass'] = $this->passencrypt($pass);
			if ($pass == 'BROZEDEXLS') {
				if(!empty($user_data['tm_access_code']) && !empty($user_data['mobile_no']) && !empty($user_data['pass'])){
					$whr = '(tm_access_code = "'.$user_data['tm_access_code'].'" AND mobile_no = "'.$user_data['mobile_no'].'" AND pass = "'.$user_data['pass'].'")';
					$usna = current($this->admin->fetch_user_exists('doctors',$whr));
					if(!empty($usna)){
						$usna['pass'] = $this->passdecrypt($usna['pass']);
						$data['status'] = array('code' => 200, 'message' => 'success', 'data' => $usna);
					}else{
						$data['status'] = array('code' => 200, 'message' => 'No Record Found');
					}
				}else{
					$data['status'] = array('code' => 300, 'message' => 'Parameters are missing!');
				}
			}else{
				$data['status'] = array('code' => 400, 'message' => 'Password should be BROZEDEXLS');
			}
		}else{
			$data['status'] = array('code' => 404, 'message' => 'Bad Request');
		}
		echo json_encode($data);
	}


	function doctor_registration(){
		$method = $_SERVER['REQUEST_METHOD'];
		if ($method == 'POST') {
			$user_data['name'] = (isset($_GET['name']) ? $_GET['name'] : '');
			$user_data['gender'] = (isset($_GET['gender']) ? $_GET['gender'] : '');
			$user_data['dob']  = (isset($_GET['dob']) ? $_GET['dob'] : '');
			$user_data['mobile_no']  = (isset($_GET['mobile_no']) ? $_GET['mobile_no'] : '');
			$user_data['place']  = (isset($_GET['place']) ? $_GET['place'] : '');
			$user_data['tm_access_code']  = (isset($_GET['tm_access_code']) ? $_GET['tm_access_code'] : '');
			$user_data['dml_no']  = (isset($_GET['dml_no']) ? $_GET['dml_no'] : '');
			$user_data['email_id']  = (isset($_GET['email_id']) ? $_GET['email_id'] : '');
			$pass  = (isset($_GET['pass']) ? $_GET['pass'] : '');
			$user_data['pass'] = $this->passencrypt($pass);
			$user_data['mr_user_id']  = (isset($_GET['mr_user_id']) ? $_GET['mr_user_id'] : '');
			$user_data['next_day'] = date('Y-m-d', strtotime(' +1 day'));
			if ($pass == 'BROZEDEXLS') {
				$whr = '(tm_access_code = "'.$user_data['tm_access_code'].'" AND mobile_no = "'.$user_data['mobile_no'].'" AND pass = "'.$user_data['pass'].'")';
				$usna = current($this->admin->fetch_user_exists('doctors',$whr));
				if(empty($usna)){
					$usna = $this->admin->add_user('doctors',$user_data);
					$sms_shoot = $this->instant_sms($user_data['name'],$user_data['email_id'],$user_data['mobile_no'],$user_data['place']);
					$data['status'] = array('code' => 201, 'message' => 'Created');
				}else{
					$data['status'] = array('code' => 200, 'message' => 'Already Exists Doctor');
				}
			}else{
				$data['status'] = array('code' => 400, 'message' => 'Password should be BROZEDEXLS');
			}
		}else{
			$data['status'] = array('code' => 404, 'message' => 'Bad Request');
		}
		echo json_encode($data);
	}

	function quiz(){
		$method = $_SERVER['REQUEST_METHOD'];
		if ($method == 'GET') {
			$whr = 'status = 0';
			$usna = $this->admin->users_fetch('quiz', $whr);
			$data['status'] = array('code' => 200, 'message' => 'success' , 'data' => $usna);
		}else{
			$data['status'] = array('code' => 404, 'message' => 'Bad Request');
		}
		echo json_encode($data);
	}

	function quiz_submitted_by_doctor(){
		$method = $_SERVER['REQUEST_METHOD'];
		if ($method == 'POST') {
			$up_data['doctor_id']  = (isset($_GET['doctor_id']) ? $_GET['doctor_id'] : '');
			$up_data['quiz_id']  = (isset($_GET['quiz_id']) ? $_GET['quiz_id'] : '');
			$up_data['quiz_answerd']  = (isset($_GET['quiz_answerd']) ? $_GET['quiz_answerd'] : '');
			$whr = '(doctor_id = '.$up_data['doctor_id'].' AND quiz_id = '.$up_data['quiz_id'].')';
			$check_already_exists = current($this->admin->fetch_user_exists('quiz_details' , $whr));
			if (!empty($check_already_exists)) {
				$user_data['quiz_answerd'] = $up_data['quiz_answerd'];
				$usna = $this->admin->update_into_table('quiz_details',$whr,$user_data);
				$data['status'] = array('code' => 201, 'message' => 'Created');
				//$data['status'] = array('code' => 406, 'message' => 'You are already applied!');
			}else{
				if (!empty($up_data['doctor_id']) && !empty($up_data['quiz_id'])) {
					$usna = $this->admin->add_user('quiz_details',$up_data);
					$data['status'] = array('code' => 201, 'message' => 'Created');
				}else{
					$data['status'] = array('code' => 300, 'message' => 'Parameters are missing!');
				}
			}
		}else{
			$data['status'] = array('code' => 404, 'message' => 'Bad Request');
		}
		echo json_encode($data);
	}

	function view_all_mr_list(){
		$method = $_SERVER['REQUEST_METHOD'];
		if ($method == 'GET') {
			$whr = '(user_type = 1)';
			$usna = $this->admin->users_fetch('users',$whr);
			$data['status'] = array('code' => 200, 'message' => 'success' , 'data' => $usna);
		}else{
			$data['status'] = array('code' => 404, 'message' => 'Bad Request');
		}
		echo json_encode($data);
	}

	function view_all_doctors_by_mr(){
		$method = $_SERVER['REQUEST_METHOD'];
		if ($method == 'GET') {
			$tm_access_code  = (isset($_GET['tm_access_code']) ? $_GET['tm_access_code'] : '');
			$whr = '(tm_access_code = '.$tm_access_code.')';
			$usna = $this->admin->users_fetch('doctors', $whr);
			$data['status'] = array('code' => 200, 'message' => 'success' , 'data' => $usna);
		}else{
			$data['status'] = array('code' => 404, 'message' => 'Bad Request');
		}
		echo json_encode($data);
	}

	function view_single_doctor_list(){
		$method = $_SERVER['REQUEST_METHOD'];
		if ($method == 'GET') {
			$doctor_id  = (isset($_GET['doctor_id']) ? $_GET['doctor_id'] : '');
			if (!empty($doctor_id)) {
				$whr = '(id = '.$doctor_id.')';
				$usna = current($this->admin->users_fetch('doctors', $whr));
				$data['status'] = array('code' => 200, 'message' => 'success' , 'data' => $usna);
			}else{
				$data['status'] = array('code' => 300, 'message' => 'Parameters are missing!');
			}
		}else{
			$data['status'] = array('code' => 404, 'message' => 'Bad Request');
		}
		echo json_encode($data);
	}

	function prescription_add(){
		$method = $_SERVER['REQUEST_METHOD'];
		if ($method == 'POST') {
			$doctor_id  = (isset($_GET['doctor_id']) ? $_GET['doctor_id'] : '');
			$prescription1  = (isset($_GET['prescription1']) ? $_GET['prescription1'] : '');
			$prescription2  = (isset($_GET['prescription2']) ? $_GET['prescription2'] : '');
			$prescription3  = (isset($_GET['prescription3']) ? $_GET['prescription3'] : '');
			$prescription4  = (isset($_GET['prescription4']) ? $_GET['prescription4'] : '');
			$prescription5  = (isset($_GET['prescription5']) ? $_GET['prescription5'] : '');
			$tm_access_code  = (isset($_GET['tm_access_code']) ? $_GET['tm_access_code'] : '');
			if (!empty($prescription1)) {
				$prescription[] = $prescription1;
			}
			if (!empty($prescription2)) {
				$prescription[] = $prescription2;
			}
			if (!empty($prescription3)) {
				$prescription[] = $prescription3;
			}
			if (!empty($prescription4)) {
				$prescription[] = $prescription4;
			}
			if (!empty($prescription5)) {
				$prescription[] = $prescription5;
			}
			//echo print_r($prescription);die;
			if (!empty($prescription) && !empty($tm_access_code) && !empty($doctor_id)) {
				$prec_count = count($prescription);
				$up_data['tm_access_code'] = $tm_access_code;
				$up_data['doctor_id'] = $doctor_id;
				for ($i=0; $i < $prec_count; $i++) { 
					$up_data['prescription'] = $prescription[$i];
					$insert_data = $this->admin->add_user('prescription_result', $up_data);
				}
				$data['status'] = array('code' => 201, 'message' => 'Created');
			}else{
				$data['status'] = array('code' => 300, 'message' => 'Parameters are missing!');
			}
		}else{
			$data['status'] = array('code' => 404, 'message' => 'Bad Request');
		}
		echo json_encode($data);
	}

	function lucky_winner(){
		$method = $_SERVER['REQUEST_METHOD'];
		if ($method == 'GET') {
			$tm_access_code  = (isset($_GET['tm_access_code']) ? $_GET['tm_access_code'] : '');
			if (!empty($tm_access_code)) {
				$lucky_winner_data = current($this->admin->lucky_winner($tm_access_code));
				$lucky_winner = $lucky_winner_data;
				$fetch_doctor_data = current($this->admin->users_fetch('doctors', 'id = '.$lucky_winner['doctor_id'].''));
				if (!empty($fetch_doctor_data)) {
					$lucky_winner['doctor_details'] = $fetch_doctor_data;
					$data['status'] = array('code' => 200, 'message' => 'success' , 'data' => $lucky_winner);
				}else{
					$data['status'] = array('code' => 406, 'message' => 'Doctor Not Found!');
				}
			}else{
				$data['status'] = array('code' => 300, 'message' => 'Parameters are missing!');
			}
		}else{
			$data['status'] = array('code' => 404, 'message' => 'Bad Request');
		}
		echo json_encode($data);
	}

	function CurlCall($method, $url, $data = false){
	    $curl = curl_init();
	    switch ($method)
	    {
	        case "POST":
	            curl_setopt($curl, CURLOPT_POST, 1);

	            if ($data)
	                curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
	            break;
	        case "PUT":
	            curl_setopt($curl, CURLOPT_PUT, 1);
	            break;
	        default:
	            if ($data)
	                $url = sprintf("%s?%s", $url, http_build_query($data));
	    }
	    curl_setopt($curl, CURLOPT_URL, $url);
	    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
	    $result = curl_exec($curl);
	    curl_close($curl);
	    return $result;
	}

	function instant_sms($name,$email_id,$mobile_no,$place){
		$url="https://control.msg91.com/api/sendhttp.php";
		$authKey = "177578AcBhGF5Vcxk5b5ed53b";
		$senderId = "WIKORL";
		$mobileNumber = '91'.$mobile_no;
		$message = urlencode("Dear Dr.".$name.", Thank you for Registration. LOGIN details are Mobile :".$mobile_no.", PLACE : ".$place.", EMAIL :".$email_id." .Team BROZEDEXLS");
		$route = "6";
		$postData = array(
		    'authkey' => $authKey,
		    'mobiles' => $mobileNumber,
		    'message' => $message,
		    'sender' => $senderId,
		    'route' => $route
		);
		$json_data = $this->CurlCall('POST',$url, $postData);
		//echo $json_data;
	}

	function send_message(){
		$today = date('Y-m-d');
		$fetch_data = $this->admin->users_fetch('doctors', 'next_day = "'.$today.'"');
		$url="https://control.msg91.com/api/sendhttp.php";
		$authKey = "177578AcBhGF5Vcxk5b5ed53b";
		$senderId = "WIKORL";
		if (!empty($fetch_data)) {
			foreach ($fetch_data as $value) {
				$mobileNumber = '91'.$value['mobile_no'];
				$message = urlencode("Dear Dr.".$value['name'].", Thank you for Registration. LOGIN details are Mobile :".$value['mobile_no'].", PLACE : ".$value['place'].", EMAIL :".$value['email_id']." .Team BROZEDEXLS");
				$route = "6";
				$postData = array(
				    'authkey' => $authKey,
				    'mobiles' => $mobileNumber,
				    'message' => $message,
				    'sender' => $senderId,
				    'route' => $route
				);
				$json_data = $this->CurlCall('POST',$url, $postData);
				echo $json_data;
			}
		}
	}

}

?>