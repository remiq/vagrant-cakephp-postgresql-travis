<?php

App::uses('Example', 'Model');

/**
 * Class ExampleTest
 * @property Example $Example
 */
class ExampleTest extends CakeTestCase {

	public $fixtures = array('app.example');

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