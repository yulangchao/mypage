<?php

class HistoriesController extends AppController {
    public $helpers = array('Html', 'Form', 'Flash');
    public $components = array('Flash');

    public function index() {
        $this->set('histories', $this->History->find('all'));
    }

}