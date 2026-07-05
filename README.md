# config

Ed's personal configuration backup. If your machine dies, start here.

## Structure

| Folder | Purpose | Priority |
|---|---|---|
| `obsidian/` | Backup of Obsidian vault system files (CLAUDE.md, MEMORY.md, voice principles, budget) | High |
| `skills/` | Claude Code CLI custom skills (doc, mr-review, summary) | Medium |
| `tmux/` | tmux configuration (`tmux.conf`) | Medium |
| `wezterm/` | WezTerm terminal configuration (`wezterm.lua`) | Medium |
| `nvim/` | NeoVim configuration (Lazy.nvim, LSP, plugins) | Low — using VS Code + Claude Code CLI instead |

## Restore After a Machine Wipe

1. **Obsidian:** Copy `obsidian/` contents into your new vault at `D:\Obsidian`. Recreate the folder structure (Buddy's Brain, The Hub, 00_Resources).
2. **Skills:** Copy `skills/` into your Claude config directory.
3. **tmux:** Copy `tmux/tmux.conf` to `~/.tmux.conf`. Reload with `tmux source-file ~/.tmux.conf`.
4. **WezTerm:** Copy `wezterm/wezterm.lua` to `~/.wezterm.lua` (`C:\Users\<you>\.wezterm.lua` on Windows). Leader key is `Ctrl-a`.
5. **NeoVim:** Copy `nvim/` to `~/AppData/Local/nvim/` on Windows (`~/.config/nvim/` on Linux/Mac). Low priority.

## Keeping This Current

When you update any config (Obsidian system files, tmux, nvim, Claude skills), copy the change here and commit. This is your fallback if a machine is lost. Claude Code is instructed to mirror config changes into this repo automatically.
