#  starship config
if not type -q starship
  # Skip if running on macOS
  if test (uname) != "Darwin"
    echo "no starship, lets auto-install it to ~/.local/bin"
    curl -sS https://starship.rs/install.sh | env BIN_DIR=$HOME/.local/bin env FORCE=true sh
  end
end

function starship_transient_prompt_func
  starship module character
end
function starship_transient_rprompt_func
  starship module time
end

starship init fish | source
#enable_transience
