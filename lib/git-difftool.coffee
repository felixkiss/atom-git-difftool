exec = require("child_process").exec

module.exports =
  activate: (state) ->
    atom.workspaceView.command "git-difftool:open", => @openDifftool()

  openDifftool: ->
    path = atom.project.getPath()
    exec "cd #{path} && git difftool" if path?
