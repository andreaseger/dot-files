if test -d "$HOME/.bun/bin"
    fish_add_path -U "$HOME/.bun/bin"
end

#pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
if not string match -q -- "$PNPM_HOME/bin" $PATH
    set -gx PATH "$PNPM_HOME/bin" $PATH
end
