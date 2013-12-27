<?php

class AllViewTest extends CakeTestSuite {

	public static function suite() {
		$suite = new CakeTestSuite('All view tests');
		$suite->addTestDirectory(TESTS . 'Case/View');
		return $suite;
	}
}
