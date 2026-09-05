# Local setup

- Interactive shell: Fish. Check the execution shell before using shell-specific syntax; keep `fish -c` free of prompt/plugin setup.
- mise manages tool versions (`~/.config/mise/config.toml` and project configs). Use `mise exec -- <command>` when tools are missing from PATH; respect project versions.

For dot-files work:

- Installed files: `dotf` wraps `git --git-dir="$HOME/.local/share/dot-files.git" --work-tree="$HOME"`. Untracked files are hidden. In a standalone clone, use normal Git and edit only that copy.
- Target macOS/Arch; degrade gracefully on older Alpine/Debian/Ubuntu. Test `.local/bin/bootstrap-dotf` in a disposable container.
- Shared skills: `.agents/skills -> ../.claude/skills`. Codex agents in `.codex/agents` read canonical `.claude/agents` instructions.
- Details: `.local/share/dot-files/README.md`. Follow project instructions in other repositories.
