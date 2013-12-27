<?php

App::uses('AppModel', 'Model');

class Example extends AppModel {

	public $useTable = false;

	public function getTruth() {
		return true;
	}
	
	public function getFalse() {
		return false;
	}
}