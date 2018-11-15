<?php
class Blog extends AppModel {
        public $validate = array(
        'title' => array(
            'rule' => 'notBlank'
        ),
        'body' => array(
            'rule' => 'notBlank'
        )
    );
	var $brwConfig = array(
		'images' => array(
			'main' => array(
				'name_category' => 'Main image',
				'sizes' => array('370x250'),
				'index' => true,
				'description' => false,
			)
		),
	);
}