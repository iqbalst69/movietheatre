<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
		$this->load->view('welcome_message');
	}

	function movies(){
		$this->load->model('Model');
		$id = $this->input->get('id');
		if(isset($id)){
			$data['movies'] = $this->Model->get('tb_movie',['movie_id' => $id])->result_array();
		}else{
			$data['movies'] = $this->Model->get('tb_movie')->result_array();
		}
		foreach($data['movies'] as $i => $d){
			$data['movies'][$i]['actors'] = $this->Model->get('tb_actor',['movie_id'=> $d['movie_id']])->result_array();
		}
		if($data['movies'] == null){
			$data['status'] = false;
			$data['msg'] = "Data Not Found!";
		}else{
			$data['status'] = true;
			$data['msg'] = " Data Found!";
		}
		echo json_encode($data);
	}
}
