---
name: pr-workflow
description: How to deliver changes to a GitHub repository - plan first, then automatically open a pull request, and leave merging as the owner's explicit manual step. Use whenever making repository changes for the owner.
---

# pr-workflow

Deliver repository changes in three phases:

1. **Plan** - Present the plan first: what changes, in which files, and why. Wait for the owner to see it.
2. **Auto PR** - Then create the branch, push, and open the pull request automatically - do not ask again for permission to create the PR. One logical change per PR; write a clear title and a body that explains the change and any trade-offs.
3. **Manual merge** - Never merge. Merging is always the owner's explicit manual step. Report the PR link and stop there.

Rules that apply at every phase:

- Never force push to main.
- Never commit secrets - use environment variables.
- Verify the PR reads back as intended (files, title, body) before reporting it.
