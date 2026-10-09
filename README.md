# claude-cmd.fish

Natural language → shell command for [fish](https://fishshell.com), powered by [Claude Code](https://claude.com/claude-code).
Nothing runs without your confirmation.

```fish
❯ ai find TODO in go files excluding vendor and tests
run ❯ rg -n 'TODO' -g '*.go' -g '!vendor/**' -g '!*_test.go' .
```

## Install

Requires fish ≥ 3.4 and an authenticated `claude` CLI in `PATH`.

```fish
fisher install michellepol/claude-cmd.fish
```

## Usage

- **`ai <request>`** — Claude suggests a command and puts it into an editable `run ❯` prompt.
  Enter runs it, Ctrl+C cancels.
- **Alt+A** — type a request right in the command line and press Alt+A: the text is replaced
  with the suggested command. Review it and press Enter as usual.

Claude is called in print mode with no tools, no MCP servers and no user settings,
so it can only print a command, never execute anything itself.

## Configuration

| Variable | Default | Meaning |
|---|---|---|
| `claude_cmd_model` | `haiku` | Model passed to `claude --model` |
| `claude_cmd_key` | `\ea` (Alt+A) | Key binding; set before the plugin loads |
| `claude_cmd_extra_prompt` | — | Extra rules appended to the system prompt |

```fish
set -U claude_cmd_model sonnet
set -U claude_cmd_extra_prompt 'Never run recursive searches in ~/huge-monorepo root.'
```

## License

MIT
