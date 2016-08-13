module.exports =
  install_plugins :
    cmd: (env) ->
      env = if typeof env isnt 'undefined' then "@#{env} " else ''
      return "wp #{env}plugin install $(< ./wp-cli/plugins.txt)"
  uninstall_plugins :
    cmd: (env) ->
      env = if typeof env isnt 'undefined' then "@#{env} " else ''
      return "wp #{env}plugin delete $(< ./wp-cli/plugins.txt)"