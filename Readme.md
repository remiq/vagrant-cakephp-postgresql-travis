vagrant-cakephp-postgresql-travis
=================================

Boilerplate that contains:
* Vagrant
* PHP
* PostgreSQL
* CakePHP
* DebugKit
* TravisCI

Advantages of usage:
* only one command to create development enviroment (vagrant up)
* example of rather rare combo CakePHP + PostgreSQL
* continuous integration ready to use (just create account on travis-ci.org and push repo to github)
    * CodeSniffer checks CakePHP coding standard
    * PHPUnit checks unit tests for Controllers, Modules and Views
* (bonus) preinstalled DebugKit
