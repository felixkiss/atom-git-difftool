exec = require("child_process").exec

module.exports =
  activate: (state) ->
    atom.commands.add 'atom-workspace', "git-difftool:diff-project", =>
      @openDifftoolForProject()
    atom.commands.add 'atom-workspace', "git-difftool:diff-file", =>
      @openDifftoolForFile()

  openDifftoolForProject: ->
    @openDifftool('')

  openDifftoolForFile: ->
    currentFile = atom.workspace.getActiveTextEditor()?.buffer?.file?.path
    @openDifftool(currentFile) if currentFile?

  openDifftool: (path) ->
    base = atom.project.getPaths()[0]
    exec "cd #{base} && git difftool --no-prompt #{path}" if base?
