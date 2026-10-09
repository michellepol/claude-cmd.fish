function _claude_cmd_commandline --description 'Replace the natural-language request in the command line with a Claude-suggested command'
    set -l request (commandline)
    test -z "$request"; and return
    commandline -r '# claude is thinking…'
    commandline -f repaint
    set -l cmd (_claude_cmd_suggest $request)
    if test -n "$cmd"
        commandline -r -- $cmd
    else
        commandline -r -- $request
    end
    commandline -f repaint
end
