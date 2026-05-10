# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_workmux_global_optspecs
	string join \n h/help V/version
end

function __fish_workmux_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_workmux_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_workmux_using_subcommand
	set -l cmd (__fish_workmux_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c workmux -n "__fish_workmux_needs_command" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_needs_command" -s V -l version -d 'Print version'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "add" -d 'Create a new worktree and tmux window'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "open" -d 'Open a tmux window for an existing worktree'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "close" -d 'Close a worktree\'s tmux window (keeps the worktree and branch)'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "merge" -d 'Merge a branch, then clean up the worktree and tmux window'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "remove" -d 'Remove a worktree, tmux window, and branch without merging'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "rm" -d 'Remove a worktree, tmux window, and branch without merging'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "list" -d 'List all worktrees'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "ls" -d 'List all worktrees'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "path" -d 'Get the filesystem path of a worktree'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "send" -d 'Send a prompt or instruction to a running agent'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "capture" -d 'Capture terminal output from a running agent'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "status" -d 'Query agent status for worktrees'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "wait" -d 'Wait for agents to reach a target status'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "run" -d 'Run a command in a worktree\'s window'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "init" -d 'Generate example .workmux.yaml configuration file'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "setup" -d 'Set up agent status tracking hooks'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "docs" -d 'Show detailed documentation (renders README.md)'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "changelog" -d 'Show the changelog (what\'s new in each version)'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "update" -d 'Update workmux to the latest version'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "dashboard" -d 'Show a TUI dashboard of all active workmux agents across all sessions'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "config" -d 'Manage global configuration'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "claude" -d 'Claude Code integration commands'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "sandbox" -d 'Manage sandbox settings'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "set-window-status" -d 'Set agent status for the current tmux window (used by hooks)'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "set-base" -d 'Set the base branch for the current worktree (used after rebasing)'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "_exec" -d 'Execute a run spec (internal use)'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "last-done" -d 'Switch to the agent that most recently completed its task'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "last-agent" -d 'Switch to the last visited agent (toggle between two)'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "host-exec" -d 'Execute a command on the host (used by guest shims)'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "clipboard-read" -d 'Read clipboard from host (used by sandbox clipboard shims)'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "completions" -d 'Generate shell completions'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "_complete-branches" -d 'Output worktree branch names for shell completion (internal use)'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "_complete-handles" -d 'Output worktree handles for shell completion (internal use)'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "_complete-git-branches" -d 'Output git branches for shell completion (internal use)'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "_check-update" -d 'Background update check (internal use)'
complete -c workmux -n "__fish_workmux_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c workmux -n "__fish_workmux_using_subcommand add" -l pr -d 'Pull request number to checkout' -r
complete -c workmux -n "__fish_workmux_using_subcommand add" -l base -d 'Base branch/commit/tag to branch from (defaults to current branch)' -r
complete -c workmux -n "__fish_workmux_using_subcommand add" -l name -d 'Explicit name for the worktree directory and tmux window (overrides worktree_naming strategy and worktree_prefix)' -r
complete -c workmux -n "__fish_workmux_using_subcommand add" -s p -l prompt -d 'Inline prompt text to store in the new worktree' -r
complete -c workmux -n "__fish_workmux_using_subcommand add" -s P -l prompt-file -d 'Path to a file whose contents should be used as the prompt' -r -F
complete -c workmux -n "__fish_workmux_using_subcommand add" -s a -l agent -d 'The agent(s) to use. Creates one worktree per agent if -n is not specified' -r
complete -c workmux -n "__fish_workmux_using_subcommand add" -s n -l count -d 'Number of worktree instances to create. Can be used with zero or one --agent. Incompatible with --foreach' -r
complete -c workmux -n "__fish_workmux_using_subcommand add" -l foreach -d 'Generate multiple worktrees from a variable matrix. Format: "var1:valA,valB;var2:valX,valY". Lists must have equal length. Incompatible with --agent and --count' -r
complete -c workmux -n "__fish_workmux_using_subcommand add" -l branch-template -d 'Template for branch names in multi-worktree modes. Variables: {{ base_name }}, {{ agent }}, {{ num }}, {{ foreach_vars }}' -r
complete -c workmux -n "__fish_workmux_using_subcommand add" -l max-concurrent -d 'Maximum number of worktrees to run concurrently. When set, waits for a slot to open before creating new worktrees' -r
complete -c workmux -n "__fish_workmux_using_subcommand add" -s A -l auto-name -d 'Generate branch name from prompt using LLM'
complete -c workmux -n "__fish_workmux_using_subcommand add" -s e -l prompt-editor -d 'Open $EDITOR to write the prompt'
complete -c workmux -n "__fish_workmux_using_subcommand add" -s H -l no-hooks -d 'Skip running post-create hooks'
complete -c workmux -n "__fish_workmux_using_subcommand add" -s F -l no-file-ops -d 'Skip file copy/symlink operations'
complete -c workmux -n "__fish_workmux_using_subcommand add" -s C -l no-pane-cmds -d 'Skip executing pane commands (panes open with plain shells)'
complete -c workmux -n "__fish_workmux_using_subcommand add" -s b -l background -d 'Create tmux window in the background (do not switch to it)'
complete -c workmux -n "__fish_workmux_using_subcommand add" -s o -l open-if-exists -d 'Open existing worktree if it exists instead of failing (like tmux new -A)'
complete -c workmux -n "__fish_workmux_using_subcommand add" -s S -l sandbox -d 'Enable sandbox mode even when disabled in config'
complete -c workmux -n "__fish_workmux_using_subcommand add" -s w -l with-changes -d 'Move uncommitted changes from the current worktree to the new worktree'
complete -c workmux -n "__fish_workmux_using_subcommand add" -l patch -d 'Interactively select which changes to move (only applies with --with-changes)'
complete -c workmux -n "__fish_workmux_using_subcommand add" -s u -l include-untracked -d 'Also move untracked files (only applies with --with-changes)'
complete -c workmux -n "__fish_workmux_using_subcommand add" -s W -l wait -d 'Block until the created tmux window is closed'
complete -c workmux -n "__fish_workmux_using_subcommand add" -s s -l session -d 'Create the window in its own tmux session (useful for session-per-project workflows)'
complete -c workmux -n "__fish_workmux_using_subcommand add" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand open" -s p -l prompt -d 'Inline prompt text to store in the new worktree' -r
complete -c workmux -n "__fish_workmux_using_subcommand open" -s P -l prompt-file -d 'Path to a file whose contents should be used as the prompt' -r -F
complete -c workmux -n "__fish_workmux_using_subcommand open" -l run-hooks -d 'Re-run post-create hooks (e.g., pnpm install)'
complete -c workmux -n "__fish_workmux_using_subcommand open" -l force-files -d 'Re-apply file operations (copy/symlink)'
complete -c workmux -n "__fish_workmux_using_subcommand open" -s n -l new -d 'Force opening in a new window (creates suffix like -2, -3) instead of switching to existing'
complete -c workmux -n "__fish_workmux_using_subcommand open" -s e -l prompt-editor -d 'Open $EDITOR to write the prompt'
complete -c workmux -n "__fish_workmux_using_subcommand open" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand close" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand merge" -l into -d 'The target branch to merge into (defaults to main_branch from config)' -r
complete -c workmux -n "__fish_workmux_using_subcommand merge" -l ignore-uncommitted -d 'Ignore uncommitted and staged changes'
complete -c workmux -n "__fish_workmux_using_subcommand merge" -l rebase -d 'Rebase the branch onto the main branch before merging (fast-forward)'
complete -c workmux -n "__fish_workmux_using_subcommand merge" -l squash -d 'Squash all commits from the branch into a single commit on the main branch'
complete -c workmux -n "__fish_workmux_using_subcommand merge" -s k -l keep -d 'Keep the worktree, window, and branch after merging (skip cleanup)'
complete -c workmux -n "__fish_workmux_using_subcommand merge" -s n -l no-verify -d 'Skip running pre-merge hooks'
complete -c workmux -n "__fish_workmux_using_subcommand merge" -l no-hooks -d 'Skip running all hooks (pre-merge and pre-remove)'
complete -c workmux -n "__fish_workmux_using_subcommand merge" -l notification -d 'Show a system notification on successful merge'
complete -c workmux -n "__fish_workmux_using_subcommand merge" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand remove" -l gone -d 'Remove worktrees whose upstream remote branch has been deleted (e.g., after PR merge)'
complete -c workmux -n "__fish_workmux_using_subcommand remove" -l all -d 'Remove all worktrees (except the main worktree)'
complete -c workmux -n "__fish_workmux_using_subcommand remove" -s f -l force -d 'Skip confirmation and ignore uncommitted changes'
complete -c workmux -n "__fish_workmux_using_subcommand remove" -s k -l keep-branch -d 'Keep the local branch (only remove worktree and tmux window)'
complete -c workmux -n "__fish_workmux_using_subcommand remove" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand rm" -l gone -d 'Remove worktrees whose upstream remote branch has been deleted (e.g., after PR merge)'
complete -c workmux -n "__fish_workmux_using_subcommand rm" -l all -d 'Remove all worktrees (except the main worktree)'
complete -c workmux -n "__fish_workmux_using_subcommand rm" -s f -l force -d 'Skip confirmation and ignore uncommitted changes'
complete -c workmux -n "__fish_workmux_using_subcommand rm" -s k -l keep-branch -d 'Keep the local branch (only remove worktree and tmux window)'
complete -c workmux -n "__fish_workmux_using_subcommand rm" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand list" -l pr -d 'Show PR status for each worktree (requires gh CLI)'
complete -c workmux -n "__fish_workmux_using_subcommand list" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand ls" -l pr -d 'Show PR status for each worktree (requires gh CLI)'
complete -c workmux -n "__fish_workmux_using_subcommand ls" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand path" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand send" -s f -l file -d 'Read prompt from file' -r
complete -c workmux -n "__fish_workmux_using_subcommand send" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand capture" -s n -l lines -d 'Number of lines to capture' -r
complete -c workmux -n "__fish_workmux_using_subcommand capture" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand status" -l json -d 'Output as JSON'
complete -c workmux -n "__fish_workmux_using_subcommand status" -l git -d 'Include git info (staged/unstaged changes, unmerged commits)'
complete -c workmux -n "__fish_workmux_using_subcommand status" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand wait" -l status -d 'Target status to wait for' -r
complete -c workmux -n "__fish_workmux_using_subcommand wait" -l timeout -d 'Maximum wait time in seconds' -r
complete -c workmux -n "__fish_workmux_using_subcommand wait" -l any -d 'Return when ANY worktree reaches target (default: wait for ALL)'
complete -c workmux -n "__fish_workmux_using_subcommand wait" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand run" -l timeout -d 'Maximum wait time in seconds' -r
complete -c workmux -n "__fish_workmux_using_subcommand run" -s b -l background -d 'Run in background without waiting (default: wait and stream output)'
complete -c workmux -n "__fish_workmux_using_subcommand run" -l keep -d 'Keep run artifacts after completion (for debugging)'
complete -c workmux -n "__fish_workmux_using_subcommand run" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand init" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand setup" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand docs" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand changelog" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand update" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand dashboard" -s P -l preview-size -d 'Preview pane size as percentage (10-90). Larger = more preview, less table' -r
complete -c workmux -n "__fish_workmux_using_subcommand dashboard" -s d -l diff -d 'Open diff view directly for the current worktree'
complete -c workmux -n "__fish_workmux_using_subcommand dashboard" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand config; and not __fish_seen_subcommand_from edit path help" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand config; and not __fish_seen_subcommand_from edit path help" -f -a "edit" -d 'Open the global configuration file in your editor ($VISUAL, $EDITOR, or vi)'
complete -c workmux -n "__fish_workmux_using_subcommand config; and not __fish_seen_subcommand_from edit path help" -f -a "path" -d 'Print the path to the global configuration file'
complete -c workmux -n "__fish_workmux_using_subcommand config; and not __fish_seen_subcommand_from edit path help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c workmux -n "__fish_workmux_using_subcommand config; and __fish_seen_subcommand_from edit" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand config; and __fish_seen_subcommand_from path" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "edit" -d 'Open the global configuration file in your editor ($VISUAL, $EDITOR, or vi)'
complete -c workmux -n "__fish_workmux_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "path" -d 'Print the path to the global configuration file'
complete -c workmux -n "__fish_workmux_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c workmux -n "__fish_workmux_using_subcommand claude; and not __fish_seen_subcommand_from prune help" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand claude; and not __fish_seen_subcommand_from prune help" -f -a "prune" -d 'Remove stale entries from ~/.claude.json for deleted worktrees'
complete -c workmux -n "__fish_workmux_using_subcommand claude; and not __fish_seen_subcommand_from prune help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c workmux -n "__fish_workmux_using_subcommand claude; and __fish_seen_subcommand_from prune" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand claude; and __fish_seen_subcommand_from help" -f -a "prune" -d 'Remove stale entries from ~/.claude.json for deleted worktrees'
complete -c workmux -n "__fish_workmux_using_subcommand claude; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and not __fish_seen_subcommand_from build pull init-dockerfile prune run install-dev stop agent shell help" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and not __fish_seen_subcommand_from build pull init-dockerfile prune run install-dev stop agent shell help" -f -a "build" -d 'Build the sandbox container image locally. Note: a pre-built image is available via `workmux sandbox pull`'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and not __fish_seen_subcommand_from build pull init-dockerfile prune run install-dev stop agent shell help" -f -a "pull" -d 'Pull the latest sandbox image from the container registry'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and not __fish_seen_subcommand_from build pull init-dockerfile prune run install-dev stop agent shell help" -f -a "init-dockerfile" -d 'Export customizable Dockerfile templates for building your own sandbox image'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and not __fish_seen_subcommand_from build pull init-dockerfile prune run install-dev stop agent shell help" -f -a "prune" -d 'Delete unused Lima VMs to reclaim disk space'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and not __fish_seen_subcommand_from build pull init-dockerfile prune run install-dev stop agent shell help" -f -a "run" -d 'Run a command inside a sandbox (internal, used by pane setup)'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and not __fish_seen_subcommand_from build pull init-dockerfile prune run install-dev stop agent shell help" -f -a "install-dev" -d 'Cross-compile and install workmux into containers and running Lima VMs for development'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and not __fish_seen_subcommand_from build pull init-dockerfile prune run install-dev stop agent shell help" -f -a "stop" -d 'Stop Lima VMs to free resources'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and not __fish_seen_subcommand_from build pull init-dockerfile prune run install-dev stop agent shell help" -f -a "agent" -d 'Run the configured agent inside a sandbox with full RPC support. Unlike `shell`, this starts an RPC server so the agent can call workmux commands (e.g., `workmux add` to spawn sub-agents)'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and not __fish_seen_subcommand_from build pull init-dockerfile prune run install-dev stop agent shell help" -f -a "shell" -d 'Start an interactive shell in a sandbox. Uses the same mounts and environment as a normal worktree sandbox'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and not __fish_seen_subcommand_from build pull init-dockerfile prune run install-dev stop agent shell help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and __fish_seen_subcommand_from build" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and __fish_seen_subcommand_from pull" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and __fish_seen_subcommand_from init-dockerfile" -l force -d 'Overwrite existing Dockerfiles'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and __fish_seen_subcommand_from init-dockerfile" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and __fish_seen_subcommand_from prune" -s f -l force -d 'Skip confirmation and delete all workmux VMs'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and __fish_seen_subcommand_from prune" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and __fish_seen_subcommand_from run" -l worktree-root -d 'Root of the worktree for mounting (defaults to worktree path)' -r -F
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and __fish_seen_subcommand_from run" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and __fish_seen_subcommand_from install-dev" -l skip-build -d 'Skip cross-compilation and use existing binary'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and __fish_seen_subcommand_from install-dev" -l release -d 'Use release profile (slower build, faster binary)'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and __fish_seen_subcommand_from install-dev" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and __fish_seen_subcommand_from stop" -l all -d 'Stop all workmux VMs (wm-* prefix)'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and __fish_seen_subcommand_from stop" -s y -l yes -d 'Skip confirmation prompt'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and __fish_seen_subcommand_from stop" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and __fish_seen_subcommand_from agent" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and __fish_seen_subcommand_from shell" -s e -l exec -d 'Exec into an existing container for this worktree instead of starting a new one (container backend only)'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and __fish_seen_subcommand_from shell" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and __fish_seen_subcommand_from help" -f -a "build" -d 'Build the sandbox container image locally. Note: a pre-built image is available via `workmux sandbox pull`'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and __fish_seen_subcommand_from help" -f -a "pull" -d 'Pull the latest sandbox image from the container registry'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and __fish_seen_subcommand_from help" -f -a "init-dockerfile" -d 'Export customizable Dockerfile templates for building your own sandbox image'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and __fish_seen_subcommand_from help" -f -a "prune" -d 'Delete unused Lima VMs to reclaim disk space'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and __fish_seen_subcommand_from help" -f -a "run" -d 'Run a command inside a sandbox (internal, used by pane setup)'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and __fish_seen_subcommand_from help" -f -a "install-dev" -d 'Cross-compile and install workmux into containers and running Lima VMs for development'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and __fish_seen_subcommand_from help" -f -a "stop" -d 'Stop Lima VMs to free resources'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and __fish_seen_subcommand_from help" -f -a "agent" -d 'Run the configured agent inside a sandbox with full RPC support. Unlike `shell`, this starts an RPC server so the agent can call workmux commands (e.g., `workmux add` to spawn sub-agents)'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and __fish_seen_subcommand_from help" -f -a "shell" -d 'Start an interactive shell in a sandbox. Uses the same mounts and environment as a normal worktree sandbox'
complete -c workmux -n "__fish_workmux_using_subcommand sandbox; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c workmux -n "__fish_workmux_using_subcommand set-window-status" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c workmux -n "__fish_workmux_using_subcommand set-base" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand _exec" -l run-dir -d 'Absolute path to run directory' -r -F
complete -c workmux -n "__fish_workmux_using_subcommand _exec" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand last-done" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand last-agent" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand host-exec" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand clipboard-read" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand completions" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand _complete-branches" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand _complete-handles" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand _complete-git-branches" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand _check-update" -s h -l help -d 'Print help'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "add" -d 'Create a new worktree and tmux window'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "open" -d 'Open a tmux window for an existing worktree'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "close" -d 'Close a worktree\'s tmux window (keeps the worktree and branch)'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "merge" -d 'Merge a branch, then clean up the worktree and tmux window'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "remove" -d 'Remove a worktree, tmux window, and branch without merging'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "list" -d 'List all worktrees'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "path" -d 'Get the filesystem path of a worktree'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "send" -d 'Send a prompt or instruction to a running agent'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "capture" -d 'Capture terminal output from a running agent'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "status" -d 'Query agent status for worktrees'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "wait" -d 'Wait for agents to reach a target status'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "run" -d 'Run a command in a worktree\'s window'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "init" -d 'Generate example .workmux.yaml configuration file'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "setup" -d 'Set up agent status tracking hooks'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "docs" -d 'Show detailed documentation (renders README.md)'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "changelog" -d 'Show the changelog (what\'s new in each version)'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "update" -d 'Update workmux to the latest version'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "dashboard" -d 'Show a TUI dashboard of all active workmux agents across all sessions'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "config" -d 'Manage global configuration'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "claude" -d 'Claude Code integration commands'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "sandbox" -d 'Manage sandbox settings'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "set-window-status" -d 'Set agent status for the current tmux window (used by hooks)'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "set-base" -d 'Set the base branch for the current worktree (used after rebasing)'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "_exec" -d 'Execute a run spec (internal use)'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "last-done" -d 'Switch to the agent that most recently completed its task'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "last-agent" -d 'Switch to the last visited agent (toggle between two)'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "host-exec" -d 'Execute a command on the host (used by guest shims)'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "clipboard-read" -d 'Read clipboard from host (used by sandbox clipboard shims)'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "completions" -d 'Generate shell completions'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "_complete-branches" -d 'Output worktree branch names for shell completion (internal use)'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "_complete-handles" -d 'Output worktree handles for shell completion (internal use)'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "_complete-git-branches" -d 'Output git branches for shell completion (internal use)'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "_check-update" -d 'Background update check (internal use)'
complete -c workmux -n "__fish_workmux_using_subcommand help; and not __fish_seen_subcommand_from add open close merge remove list path send capture status wait run init setup docs changelog update dashboard config claude sandbox set-window-status set-base _exec last-done last-agent host-exec clipboard-read completions _complete-branches _complete-handles _complete-git-branches _check-update help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c workmux -n "__fish_workmux_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "edit" -d 'Open the global configuration file in your editor ($VISUAL, $EDITOR, or vi)'
complete -c workmux -n "__fish_workmux_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "path" -d 'Print the path to the global configuration file'
complete -c workmux -n "__fish_workmux_using_subcommand help; and __fish_seen_subcommand_from claude" -f -a "prune" -d 'Remove stale entries from ~/.claude.json for deleted worktrees'
complete -c workmux -n "__fish_workmux_using_subcommand help; and __fish_seen_subcommand_from sandbox" -f -a "build" -d 'Build the sandbox container image locally. Note: a pre-built image is available via `workmux sandbox pull`'
complete -c workmux -n "__fish_workmux_using_subcommand help; and __fish_seen_subcommand_from sandbox" -f -a "pull" -d 'Pull the latest sandbox image from the container registry'
complete -c workmux -n "__fish_workmux_using_subcommand help; and __fish_seen_subcommand_from sandbox" -f -a "init-dockerfile" -d 'Export customizable Dockerfile templates for building your own sandbox image'
complete -c workmux -n "__fish_workmux_using_subcommand help; and __fish_seen_subcommand_from sandbox" -f -a "prune" -d 'Delete unused Lima VMs to reclaim disk space'
complete -c workmux -n "__fish_workmux_using_subcommand help; and __fish_seen_subcommand_from sandbox" -f -a "run" -d 'Run a command inside a sandbox (internal, used by pane setup)'
complete -c workmux -n "__fish_workmux_using_subcommand help; and __fish_seen_subcommand_from sandbox" -f -a "install-dev" -d 'Cross-compile and install workmux into containers and running Lima VMs for development'
complete -c workmux -n "__fish_workmux_using_subcommand help; and __fish_seen_subcommand_from sandbox" -f -a "stop" -d 'Stop Lima VMs to free resources'
complete -c workmux -n "__fish_workmux_using_subcommand help; and __fish_seen_subcommand_from sandbox" -f -a "agent" -d 'Run the configured agent inside a sandbox with full RPC support. Unlike `shell`, this starts an RPC server so the agent can call workmux commands (e.g., `workmux add` to spawn sub-agents)'
complete -c workmux -n "__fish_workmux_using_subcommand help; and __fish_seen_subcommand_from sandbox" -f -a "shell" -d 'Start an interactive shell in a sandbox. Uses the same mounts and environment as a normal worktree sandbox'
# Dynamic worktree handle completion (directory names)
# Used for open/remove/merge/path/close - these accept handles or branch names
function __workmux_handles
    workmux _complete-handles 2>/dev/null
end

# Dynamic git branch completion for add command
function __workmux_git_branches
    workmux _complete-git-branches 2>/dev/null
end

# Add dynamic completions for commands that take worktree handles or branch names
# (handles are the primary identifier shown in completions)
complete -c workmux -n '__fish_seen_subcommand_from open remove rm path merge close send capture status wait run' -f -a '(__workmux_handles)'
# Add dynamic completions for add command (uses git branches)
complete -c workmux -n '__fish_seen_subcommand_from add' -f -a '(__workmux_git_branches)'
