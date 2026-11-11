---
name: doc
description: Generate a README.md for the current project by analyzing its structure, entry points, and tooling. Use when asked to document a project or create or refresh its README.
---

# doc

Generate README documentation for the current project. Works with any agent that supports the SKILL.md format (Claude Code, GitHub Copilot, Codex, opencode).

## What it does

1. **Analyzes Project Structure**
   - Scans the codebase to understand the project
   - Identifies main entry points and modules
   - Detects language and framework used

2. **Generates README Content**
   - Project title and description
   - Installation instructions
   - Usage examples
   - Configuration options
   - Contributing guidelines
   - License section

3. **Customization**
   - Adapts to project type (library, CLI tool, web app, etc.)
   - Includes language-specific setup steps
   - Generates appropriate badges and links
