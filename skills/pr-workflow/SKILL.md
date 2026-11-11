---
name: pr-workflow
description: Use when making changes to a GitHub repository - the phased workflow of planning first, then automatically opening a pull request, while merging stays a manual step for the repository owner.
---

# pr-workflow

How repository changes are delivered. Agent-agnostic: the same rule applies to Claude Code, GitHub Copilot, Codex, and opencode.

## The three phases

1. **Plan** - Before touching anything, present a short plan: what will change, in which files, and why. No branches, commits, pushes, or PRs happen before the plan is shown.
2. **Auto PR** - Once the plan is set, create the branch, commit, push, and open the pull request without asking again. Keep the PR to one logical change, with a clear title and a body that explains what changed and any trade-offs. Verify the PR reads back correctly before reporting it.
3. **Manual merge** - Merging is always the repository owner's explicit, manual step. Never merge a pull request yourself, and never treat silence as merge approval. If a change needs to land urgently, say so and let the owner merge it.

## Notes

- Never force push to main.
- Never commit secrets (API keys, tokens, credentials) - use environment variables.
- Personal memory files are maintained separately and never belong in a config repo.
