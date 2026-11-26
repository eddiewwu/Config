# GitHub Copilot Instructions

This repo is Ed's personal config backup: skills, agent instructions, and tool configs. It is agent-agnostic - the same content drives Claude Code, GitHub Copilot, Codex, and opencode.

## Canonical sources

- **Global agent rules:** `agents/AGENTS.md` is the canonical copy. Follow it in this repo and everywhere else.
- **Skills:** `skills/` holds one folder per skill, each with a `SKILL.md` in the standard Agent Skills format (YAML frontmatter: `name`, `description`). The same folders load in every agent - Claude Code from `~/.claude/skills/`, Copilot CLI from `~/.copilot/skills/`, and equivalents for other tools.
- **Repo guidelines:** `.claude.md` at the repo root holds the working rules for this repo (structure, sync rule, coding rules). Despite the name it applies to every agent, not just Claude.

## Rules for this repo

- Never commit secrets (API keys, tokens, credentials) - use environment variables
- Never force push to main
- When a config changes on the machine, mirror it into the matching folder here (see the sync rule in `.claude.md`)
- Personal memory files are maintained separately and never belong in this repo
