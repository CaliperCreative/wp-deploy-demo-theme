<?php

add_action( 'wp_enqueue_scripts', 'deploy_demo_enqueue_styles' );
function deploy_demo_enqueue_styles() {
    wp_enqueue_style( 'parent-style', get_template_directory_uri() . '/style.css' );

  wp_enqueue_style( 'wp-deploy-demo',
    get_stylesheet_directory_uri() . '/assets/css/wp-deploy-demo.css',
    array('parent-style') //make sure the the child's style.css comes after the parents so you can overwrite rules
  );

}

?>