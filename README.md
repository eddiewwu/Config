# config

Ed's personal configuration backup. If your machine dies, start here.

## Scope

This repo holds skills, agent instructions, and tool configs. Personal memory files — notes about Ed himself — are maintained separately and do not belong here. If it is about Ed rather than about tooling, it does not go in this repo.

## Structure

| Folder | Purpose | Priority |
|---|---|---|
| `agents/` | Model-agnostic global agent instructions (canonical live copy at `~/.config/AGENTS.md`) | High |
| `claude/` | Claude Code global CLAUDE.md (live copy at `~/.claude/CLAUDE.md`, imports `~/.config/AGENTS.md`) | High |
| `skills/` | Agent Skills in the standard `SKILL.md` format (doc, mr-review, summary) — one canonical copy shared by Claude Code, GitHub Copilot, Codex, and opencode | Medium |
| `.github/` | GitHub Copilot repo instructions (`copilot-instructions.md`, points at `agents/AGENTS.md` and `skills/`) | Medium |
| `herdr/` | Herdr terminal workspace config (live copy at `%APPDATA%\herdr\config.toml`) | Medium |
| `tmux/` | tmux configuration (`tmux.conf`) | Medium |
| `wezterm/` | WezTerm terminal configuration (`wezterm.lua`) | Medium |
| `nvim/` | NeoVim configuration (Lazy.nvim, LSP, plugins) | Low — using VS Code + Claude Code CLI instead |

## Restore After a Machine Wipe

1. **Agent instructions:** Copy `agents/AGENTS.md` to `~/.config/AGENTS.md`, and `claude/CLAUDE.md` to `~/.claude/CLAUDE.md`. Then refresh the plain copies for the other tools (`~/.codex/AGENTS.md`, `~/.config/opencode/AGENTS.md`) — see the fan-out rule in `.claude.md`.
2. **Skills:** Copy each `skills/<name>/` folder into your agent's skills directory — `~/.claude/skills/` for Claude Code, `~/.copilot/skills/` for GitHub Copilot CLI, and the equivalent for other agents. The `SKILL.md` format is agent-agnostic, so the same folders work everywhere.
3. **tmux:** Copy `tmux/tmux.conf` to `~/.tmux.conf`. Reload with `tmux source-file ~/.tmux.conf`.
4. **WezTerm:** Copy `wezterm/wezterm.lua` to `~/.wezterm.lua` (`C:\Users\<you>\.wezterm.lua` on Windows). Leader key is `Ctrl-Space` — the same as the tmux prefix and the Herdr prefix; press it twice to send a literal `Ctrl-Space` through to the app inside.
5. **Herdr:** Copy `herdr/config.toml` to `%APPDATA%\herdr\config.toml`. Herdr is also in the WezTerm launch menu.
6. **NeoVim:** Copy `nvim/` to `~/AppData/Local/nvim/` on Windows (`~/.config/nvim/` on Linux/Mac). Low priority.

## Keeping This Current

When you update any config (tmux, nvim, Claude skills, agent instructions), copy the change here and commit. This is your fallback if a machine is lost. Claude Code is instructed to mirror config changes into this repo automatically. Memory files are the exception — they are maintained separately, never copied here.
