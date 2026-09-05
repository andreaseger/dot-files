status is-interactive; or return

if type -q sudo
    abbr -a ! sudo
    function !!
        sudo su
    end
end
abbr -a h ~
function l --wraps ls
    ls -lah $argv
end
function l. --wraps ls
    ls -d .* $argv
end
function ll --wraps ls
    ls -lh $argv
end

if type -q bundle
    abbr -a b bundle
    abbr -a be 'bundle exec'
end
if type -q nvim
    abbr -a vim nvim
end
