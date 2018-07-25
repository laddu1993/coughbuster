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
			$user_data['mobile_no'] = (isset($_GET['mobile_number']) ? $_GET['mobile_number'] : '');
			$pswd = (isset($_GET['pswd']) ? $_GET['pswd'] : '');
			$user_data['pass'] = $this->passencrypt($pswd);

			if(!empty($user_data['mobile_no']) && !empty($user_data['pass'])){
				$whr = '(mobile_no = '.$user_data['mobile_no'].' AND pass ="'.$user_data['pass'].'" AND user_status = 0)';
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

	

}

?>