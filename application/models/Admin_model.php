<?php
//error_reporting(E_ALL);
//ini_set("display_errors",1);
/**
 * This model is used for inserting,Editing and updating the seo commencement form.
 */
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

}