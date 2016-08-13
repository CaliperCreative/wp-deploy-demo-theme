deployconfig = require('./deployconfig.json')

module.exports = (grunt) ->

  require('load-grunt-config')(grunt,
    config:
      deployconfig : deployconfig
      pkg: grunt.file.readJSON('package.json')
      theme_name: 'wp-deploy-theme'      
  )

  # Register tasks
  grunt.registerTask "default" , ["watch"]
  
  # Dependency Management
  target = if typeof grunt.option('target') isnt 'undefined' then ':' + grunt.option('target') else '';
  grunt.registerTask "install_plugins" , ["exec:install_plugins#{target}"]
  grunt.registerTask "uninstall_plugins" , ["exec:uninstall_plugins#{target}"]
  
  grunt.registerTask "build"   , ["clean:build", "copy:build", "compress:build"]
  grunt.registerTask "deploy"  , ["build", "push_theme"]
  grunt.registerTask "sync_up" , ["push_plugins", "push_uploads", "deploy", "push_db"]
  return

