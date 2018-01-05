<?php
  class Dblang extends CI_Model {
       
     public function __construct(){
          
        $this->load->database();
        
      }
      
      
      public function getlang($var,$lang){  

           $this->db->select('*');

           $this->db->from('lang');

           $this->db->where('var',$var);

           $query = $this->db->get();
           
           if($query->num_rows() == 1)
           {

					
					$ret = $query->row();
					if($lang == 'english' || $lang == 'English' ){
					return $ret->english;
					}else if($lang == 'dutch' || $lang == 'Dutch'){
					return $ret->dutch;
					}else{
						return $ret->english;
					}
           }
           else
           {

             return '';

		}

      }
	  

}