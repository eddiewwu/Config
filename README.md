# config

Ed's personal configuration backup. If your machine dies, start here.

## Structure

| Folder | Purpose | Priority |
|---|---|---|
| `obsidian/` | Backup of Obsidian vault system files (CLAUDE.md, MEMORY.md, voice principles, budget) | High |
| `skills/` | Claude Code CLI custom skills (doc, mr-review, summary) | Medium |
| `nvim/` | NeoVim configuration (Lazy.nvim, LSP, plugins) | Low — using VS Code + Claude Code CLI instead |

## Restore After a Machine Wipe

1. **Obsidian:** Copy `obsidian/` contents into your new vault at `D:\Obsidian`. Recreate the folder structure (Buddy's Brain, The Hub, 00_Resources).
2. **Skills:** Copy `skills/` into your Claude config directory.
3. **NeoVim:** Copy `nvim/` to `~/.config/nvim/` if needed. Low priority.

## Keeping This Current

When you update your Obsidian system files (CLAUDE.md, MEMORY.md, Budget.md, voice-principles.md), copy them here and commit. This is your fallback if Obsidian is lost.
