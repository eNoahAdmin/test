<?php
  class User extends CI_Model {
       
      public function __construct(){
          
        $this->load->database();
        
      }
      
      
      public function getuser($id){  

           $this->db->select('*');

           $this->db->from('users');

           $this->db->where('id',$id);

           $query = $this->db->get();
           
           if($query->num_rows() == 1)
           {

               return $query->result_array();

           }
           else
           {

             return 0;

          }

      }
	  public function emailisunique($email){  

           $this->db->select('*');

           $this->db->from('users');

           $this->db->where('email',$email);

           $query = $this->db->get();
           
          if($query->num_rows() > 0){

          return $query->result_array();

        }else{

          return 0;

        }

      }

    
    public function getalluser(){   

        $this->db->select('*');

        $this->db->from('users');

        $this->db->order_by("id", "desc"); 

        $query = $this->db->get();

        if($query->num_rows() > 0){

          return $query->result_array();

        }else{

          return 0;

        }

    }
   
   
    public function delete($id){

       $this->db->where('id', $id);

       if($this->db->delete('users')){

          return true;

        }else{

          return false;

        }

   }
   
   
    public function add($data){

        if($this->db->insert('users', $data)){

           return true;

        }else{

           return false;

        }

    }
    
    
    public function update($id, $data){

       $this->db->where('id', $id);

       if($this->db->update('users', $data)){

          return true;

        }else{

          return false;

        }

    }

}