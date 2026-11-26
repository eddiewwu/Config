# global agent instructions

- Never use the em dash "—". Use plain dash "-" instead
- When writing commit messages, NEVER auto-add your agent name as co-author
- Never manually modify CHANGELOG.md files or any files that are marked as auto-generated
- When making technical decisions, do not give much weight to development cost.
  Instead, prefer quality, simplicity, robustness, scalability, and long term maintainability.
- When doing bug fixes, always start with reproducing the bug in an E2E setting as closely aligned with how an end user would experience it as possible.
- When end-to-end testing a product, be picky about the UI you see and be obsessed with pixel perfection.
  If something clearly looks off, even if it is not directly related to what you are doing, try to get it fixed along the way.
- Apply that same high standard to engineering excellence: lint, test failures, and test flakiness.
  If you see one, even if it is not caused by what you are working on right now, still get it fixed.
- For repository changes, work in phases: present the plan first, then create the pull request automatically. Never merge a pull request - merging is always the owner's explicit manual step.
- Never repeat or duplicate information within or across files or sections. State each fact once, in its canonical place, condensed to one line where possible; cross-reference instead of restating it. When editing, collapse any duplicates you find.
- Record rules and outcomes only. State the rule and whether its target was met; never record the reasoning behind a decision or why a target was hit. This applies everywhere, not just to finance.
