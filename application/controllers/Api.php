<?php

defined('BASEPATH') OR exit('No direct script access allowed');

// This can be removed if you use __autoload() in config.php OR use Modular Extensions
/** @noinspection PhpIncludeInspection */
require APPPATH . 'libraries/REST_Controller.php';

/**
 * This is an example of a few basic user interaction methods you could use
 * all done with a hardcoded array
 *
 * @package         CodeIgniter
 * @subpackage      Rest Server
 * @category        Controller
 * @author          Phil Sturgeon, Chris Kacerguis
 * @license         MIT
 * @link            https://github.com/chriskacerguis/codeigniter-restserver
 */
class Api extends REST_Controller {

    function __construct()
    {
        // Construct the parent class
        parent::__construct();

         $this->load->model('user');
		  $this->load->model('dblang');
        // Configure limits on our controller methods
        // Ensure you have created the 'limits' table and enabled 'limits' within application/config/rest.php
        $this->methods['users_get']['limit'] = 500; // 500 requests per hour per user/key
        $this->methods['users_post']['limit'] = 100; // 100 requests per hour per user/key
        $this->methods['users_delete']['limit'] = 50; // 50 requests per hour per user/key
    }

    public function user_get()
    {
		$id      = $this->get('id');
		
				
       $result = $this->user->getuser($id);

		$resp=array();
	   
        if($result){
			
			$resp['status']='success';
			$resp['message']=$this->dblang->getlang('user_info',$result[0]['app_language']);
			$resp['data']=$result;
            $this->response($resp, 200); 

        } 

        else{

			$resp['status']='error';
			$resp['message']=$this->dblang->getlang('no_user_found','english');
			$resp['data']=array();
            $this->response($resp, 404);

        }
	}
	
    public function users_get()
    {
       $result = $this->user->getalluser();

		$resp=array();
	   
        if($result){
			
			$resp['status']='success';
			$resp['message']='List of users';
			$resp['data']=$result;
            $this->response($resp, 200); 

        } 

        else{

			$resp['status']='error';
			$resp['message']='No record found';
			$resp['data']=array();
            $this->response($resp, 404);

        }
	}

    public function users_post()
    {
         $name      = $this->post('name');

         $email     = $this->post('email');

         $lang    = $this->post('app_language');
		
		$emailisunique = $this->user->emailisunique($email);
        
         if(!$name || !$email || !$lang ){
			$resp['status']='error';
			$resp['message']=$this->dblang->getlang('complete_info',$lang);
			$resp['data']=array("name"=>$name, "email"=>$email, "app_language"=>$lang);
                $this->response($resp, 400);

         }else{
			if($emailisunique != 0){
			$resp['status']='error';
			$resp['message']=$this->dblang->getlang('email_already_exist',$lang);
			$resp['data']=array("name"=>$name, "email"=>$email, "app_language"=>$lang);
			
                $this->response($resp, 400);
			 }else{
				 
			$result = $this->user->add(array("name"=>$name, "email"=>$email, "app_language"=>$lang, "created_at"=>date('y-m-d H:i:s')));
			 
            if($result === 0){
				$resp['status']='error';
				$resp['message']='User information coild not be saved. Try again';
				$resp['data']=array("name"=>$name, "email"=>$email, "app_language"=>$lang);
				

                $this->response($resp, 404);

            }else{
				$resp['status']='success';
				$resp['message']=$this->dblang->getlang('user_reg_success',$lang);
				$resp['data']=array("name"=>$name, "email"=>$email, "app_language"=>$lang, "created_at"=>date('y-m-d H:i:s'));
			
			
                $this->response($resp, 200);  
           
            }
			}

        }
    }
    public function users_put()
    {
         $id      = $this->put('id');
         
         $name      = $this->put('name');

         $email     = $this->put('email');

         $lang    = $this->put('app_language');

        
         if(!$name || !$email || !$lang ){

                $resp['status']='error';
			$resp['message']='Enter complete user information to save';
			$resp['data']=array("id"=>$id,"name"=>$name, "email"=>$email, "app_language"=>$lang);
                $this->response($resp, 400);


         }else{

            $result = $this->user->update($id,array("name"=>$name, "email"=>$email, "app_language"=>$lang));

            if($result === 0){

               $resp['status']='error';
				$resp['message']='User information coild not be saved. Try again';
				$resp['data']=array("id"=>$id,"name"=>$name, "email"=>$email, "app_language"=>$lang);
				
            }else{

               $resp['status']='success';
				$resp['message']='User Updated';
				$resp['data']=array("id"=>$id,"name"=>$name, "email"=>$email, "app_language"=>$lang);
			$this->response($resp, 200);  
           
            }

        }
    }

    public function users_delete()
    {
        $id  = $this->delete('id');

        if(!$id){
			
				$resp['status']='error';
				$resp['message']='Parameter missing';
				$resp['data']=array("id"=>$id);
			
			
            $this->response($resp, 404);

        }
         
        if($this->user->delete($id))
        {
				$resp['status']='Success';
				$resp['message']='User deleted';
				$resp['data']=array("id"=>$id);
            $this->response($resp, 200);

        } 
        else
        {		$resp['status']='error';
				$resp['message']='Failed';
				$resp['data']=array("id"=>$id);

            $this->response($resp, 400);

        }

    }

}
