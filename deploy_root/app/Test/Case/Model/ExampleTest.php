<?php

App::uses('Example', 'Model');

class ExampleTest extends CakeTestCase {

	public $fixtures = array('app.example');

/**
 * @var Example
 */

	public $Example;

	public function setUp() {
		parent::setUp();
		$this->Example = ClassRegistry::init('Example');
	}

	public function testTruth() {
		$this->assertEqual($this->Example->getTruth(), true);
	}

	public function testFalse() {
		$this->assertEqual($this->Example->getFalse(), false);
	}
}