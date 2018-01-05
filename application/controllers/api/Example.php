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
class Example extends REST_Controller {

    function __construct()
    {
        // Construct the parent class
        parent::__construct();

         $this->load->model('user');
       
    }

    public function users_get()
    {
       $result = $this->user->getalluser();

        if($result){

            $this->response($result, 200); 

        } 

        else{

            $this->response("No record found", 404);

        }
	}

    public function users_post()
    {
         $name      = $this->post('name');

         $email     = $this->post('email');

         $lang    = $this->post('app_language');

        
         if(!$name || !$email || !$lang ){

                $this->response("Enter complete user information to save", 400);

         }else{

            $result = $this->user->add(array("name"=>$name, "email"=>$email, "app_language"=>$lang, "created_at"=>date('y-m-d H:i:s')));

            if($result === 0){

                $this->response("User information coild not be saved. Try again.", 404);

            }else{

                $this->response("success", 200);  
           
            }

        }
    }

    public function users_delete()
    {
        $id  = $this->delete('id');

        if(!$id){

            $this->response("Parameter missing", 404);

        }
         
        if($this->user->delete($id))
        {

            $this->response("Success", 200);

        } 
        else
        {

            $this->response("Failed", 400);

        }

    }

}
