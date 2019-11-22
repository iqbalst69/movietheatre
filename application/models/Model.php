<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Model extends CI_Model{
    function get($table, $where =null){
        if(!is_null($where)){
			$this->db->where($where);
		}
		return $this->db->get($table);
    }
    
    function join($from, &$table, &$join, $where=null){
		$i = 0;
		foreach ($table as $data ) {
			$tabel = $table[$i];
			$relasi = $join[$i];			
			$this->db->join($tabel, $relasi);
		$i++;
		}
		if (!is_null($where)) {
			$this->db->where($where);
		}
		return $this->db->get($from);
	}
}