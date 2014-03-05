exec = require("child_process").exec

module.exports =
  activate: (state) ->
    atom.workspaceView.command "git-difftool:diff-project", => @openDifftoolForProject()
    atom.workspaceView.command "git-difftool:diff-file", => @openDifftoolForFile()

  openDifftoolForProject: ->
    @openDifftool('')

  openDifftoolForFile: ->
    currentFile = atom.workspace.getActiveEditor().buffer?.file?.path
    @openDifftool(currentFile) if currentFile?

  openDifftool: (path) ->
    base = atom.project.getPath()
    exec "cd #{base} && git difftool #{path}" if base?
