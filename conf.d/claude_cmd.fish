status is-interactive; or exit

set -q claude_cmd_key; or set -g claude_cmd_key \ea

bind $claude_cmd_key _claude_cmd_commandline
bind -M insert $claude_cmd_key _claude_cmd_commandline 2>/dev/null

# Event name is derived by fisher from this file's basename
function _claude_cmd_uninstall --on-event claude_cmd_uninstall
    bind -e $claude_cmd_key
    bind -e -M insert $claude_cmd_key 2>/dev/null
    functions -e _claude_cmd_uninstall
end
