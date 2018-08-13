<?php
/**
 *
 * @package    Admin_model
 * @author     Vinil Lakkavatri (vinil.lakkavatri@icloud.com)
 * @copyright  2017 Vinil Lakkavatri
 * @ci_version 3.1.2 echo CI_VERSION;
 * @deprecated File deprecated in Release 2.0.0
 *
 **/
Class Admin_model extends CI_Model
{

    function __construct()
    {
        parent::__construct();

        if ($_SERVER['HTTP_HOST'] == 'localhost')
        {
            $this->db = $this->load->database('default', TRUE);
        }else{
            $this->db = $this->load->database('default', TRUE);
        }
    }

    function add_user($table_name,$data){
        $this->db->insert($table_name, $data);
    }

    function update_user($id,$data){
        $this->db->where('Usr_Id', $id);
        $this->db->update('users', $data);
    }

    function users_delete($table_name,$where){
        $this->db->where($where);
        $this->db->delete($table_name);
        return true;
    }

    function check_login($data){
        $sql = "SELECT * FROM users WHERE email_id = ? AND pass = ? AND user_status = ?";
        $query = $this->db->query($sql, array($data['email'], $data['password'], 0));
        return $query->result_array();
    }

    function users_fetch($table_name,$where=''){
        if (!empty($where)) {
            $this->db->where($where);
        }
        $this->db->order_by('added_date', 'DESC');
        $query = $this->db->select("*")
                ->get($table_name);
        return $query->result_array();
    }

    function website_content($id=''){
        if (!empty($id)) {
            $this->db->where('Wp_Id', $id);
            $query = $this->db->get("webpage");
            return $query->result_array();
        }else{
        $query = $this->db->select("*")
                ->get('webpage');
        return $query->result_array();
        }
    }

    function update_website_content($id,$data){
        $this->db->where('Wp_Id', $id);
        $this->db->update('webpage', $data);
    }

    // API Queries start from here
    function fetch_user_exists($table_name,$whr=''){
        if (!empty($whr)) {
            $this->db->where($whr);
        }
        $query = $this->db->select("*")
                ->get($table_name);
        return $query->result_array();
    }

    function update_into_table($table_name,$whr,$data){
        $this->db->where($whr);
        $this->db->update($table_name, $data);
    }

    function lucky_winner($tm_access_code){
        $sql = "SELECT doctor_id,tm_access_code, COUNT(*) as doctor_prescription_count FROM prescription_result WHERE tm_access_code = ".$tm_access_code." GROUP BY doctor_id ORDER BY doctor_prescription_count DESC LIMIT 1";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    function fetch_reports(){
        $sql = "SELECT t1.*, t2.* FROM `prescription_result` t1 LEFT JOIN doctors t2 ON t2.id = t1.doctor_id";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    function quiz_reports(){
        $sql = "SELECT t1.quiz_answerd,t1.added_date, t2.type,t2.question,t2.file_url,t2.correct_answer,t3.name,t3.email_id,t3.mobile_no from quiz_details t1 LEFT JOIN quiz t2 ON t2.id = t1.quiz_id LEFT JOIN doctors t3 ON t3.id = t1.doctor_id ORDER BY t1.added_date DESC";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    

}