<?php

// File: /app/Controller/BlogsController.php
class BlogsController extends AppController {
    public $helpers = array('Html', 'Form', 'Flash');
    public $components = array('Flash','Paginator');

    public function index() {
        $paginate = array(
            'limit' => 6,
            'order' => array(
                'Blog.id' => 'desc'
            )
        );
        $this->Paginator->settings = $paginate;
        $blogs = $this->Paginator->paginate('Blog');
        $this->set('blogs', $blogs);
    }

    public function view($id) {
        if (!$id) {
            throw new NotFoundException(__('Invalid blog'));
        }

        $blog = $this->Blog->findById($id);
        if (!$blog) {
            throw new NotFoundException(__('Invalid blog'));
        }
        $this->set('blog', $blog);
    }

    public function add() {
        if ($this->request->is('blog')) {
            $this->Blog->create();
            if ($this->Blog->save($this->request->data)) {
                $this->Flash->success(__('Your blog has been saved.'));
                return $this->redirect(array('action' => 'index'));
            }
            $this->Flash->error(__('Unable to add your blog.'));
        }
    }
}