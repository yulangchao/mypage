<?php

// File: /app/Controller/WebsitesController.php
class WebsitesController extends AppController {
    public $helpers = array('Html', 'Form', 'Flash');
    public $components = array('Flash','Paginator');

    public function index() {
        $paginate = array(
            'limit' => 6,
            'order' => array(
                'Website.id' => 'desc'
            )
        );
        $this->Paginator->settings = $paginate;
        $websites = $this->Paginator->paginate('Website');
        $this->set('websites', $websites);
    }

    public function click($id) {
        $this->autoRender = false;
        if ($this->request->is('ajax')) {
            $this->Website->updateAll(
                array('views' => 'views+1'),                    
                array('id' => $id)
            );
        }
    }

}