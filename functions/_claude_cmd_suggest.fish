function _claude_cmd_suggest --description 'Turn a natural-language request into a single fish command via Claude Code'
    set -q claude_cmd_model; or set -l claude_cmd_model haiku

    set -l system_prompt "You translate a request into ONE shell command for fish $FISH_VERSION on "(uname -s)".
Current directory: $PWD.
Reply with the command only: no markdown, no backticks, no explanations.
Use fish syntax (no bash-only constructs like \$(...)).
Prefer rg/fd when they fit.
$claude_cmd_extra_prompt"

    claude -p "$argv" \
        --model $claude_cmd_model \
        --system-prompt "$system_prompt" \
        --tools "" \
        --strict-mcp-config \
        --setting-sources "" \
        --no-session-persistence \
        2>/dev/null | string trim | string replace -r '^```\w*\s*|\s*```$' ''
    return 0
end
