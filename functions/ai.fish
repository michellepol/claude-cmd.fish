function ai --description 'Ask Claude for a shell command, edit or confirm it, then run'
    if test (count $argv) -eq 0
        echo 'usage: ai <what you want to do>' >&2
        return 1
    end

    set -l cmd (_claude_cmd_suggest $argv)
    if test -z "$cmd"
        echo 'ai: empty answer from claude' >&2
        return 1
    end

    # Enter runs (the command can be edited first), Ctrl+C cancels
    read -l -c "$cmd" -P (set_color yellow)'run ❯ '(set_color normal) final
    or return 130
    test -z "$final"; and return 0

    builtin history append -- $final 2>/dev/null
    eval $final
end
