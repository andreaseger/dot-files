if test -d "$HOME/.bun/bin"
    fish_add_path -g "$HOME/.bun/bin"
end

# pnpm keeps its global bin in a platform specific location
switch (uname)
    case Darwin
        set -gx PNPM_HOME "$HOME/Library/pnpm"
    case '*'
        set -gx PNPM_HOME "$HOME/.local/share/pnpm"
end
if test -d "$PNPM_HOME"
    fish_add_path -g "$PNPM_HOME"
end
