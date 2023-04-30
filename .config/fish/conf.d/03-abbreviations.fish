abbr -a ! sudo
abbr -a h ~
function !!; sudo su; end
function l  --wraps ls; ls -lah $argv; end
function l. --wraps ls; ls -d .* $argv; end
function ll --wraps ls; ls -lh $argv; end

abbr -a b bundle
abbr -a be 'bundle exec'