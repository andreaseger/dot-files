status is-interactive; or return

set -l coral plttn/tide
if not test -e "$__fish_config_dir/corals/$coral"
    reef install $coral
    echo "Installed Tide prompt. You might need a NerdFont to see all icons properly."
    switch (uname)
        case Linux
            echo "On Archlinux, you can install NerdFonts via your package manager, e.g.,"
            echo "  sudo pacman -S ttf-meslo-nerd"
            echo "  sudo pacman -S ttf-firacode-nerd"
        case Darwin
            echo "On macOS, you can install NerdFonts via Homebrew, e.g.,"
            echo "  brew install --cask font-meslo-lg-nerd-font"
            echo "  brew install --cask font-fira-code-nerd-font"
        case '*'
            echo "get something from here https://github.com/ryanoasis/nerd-fonts"
    end
    # set theme (in case we have other plugins with a fish_prompt function)
    reef theme $coral
    # load tide for current session (07-reef ran before tide existed, so add its paths now)
    set -a fish_function_path (path resolve $__fish_config_dir/corals/$coral/functions)
    set -a fish_complete_path (path resolve $__fish_config_dir/corals/$coral/completions)
    source (path resolve $__fish_config_dir/corals/$coral/conf.d/*.fish)
end

if not set -q tide_configured
    echo "Configuring Tide prompt..."
    tide configure --auto --style=Classic --prompt_colors='True color' --classic_prompt_color=Darkest --show_time='24-hour format' --classic_prompt_separators=Vertical --powerline_prompt_heads=Slanted --powerline_prompt_tails=Flat --powerline_prompt_style='One line' --prompt_spacing=Compact --icons='Many icons'

    set -U tide_configured true
end

# Enable transient prompt by default
set -g fish_transient_prompt 1

# TBD replace all nerdfont icons with suitable alternatives
# see .config/fish/corals/plttn/tide/functions/tide/configure/icons.fish
