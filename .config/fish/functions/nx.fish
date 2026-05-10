function nx --description 'Run nx via the project package manager (detected from repo root lockfile)'
    set -l root (git rev-parse --show-toplevel 2>/dev/null)
    or set root $PWD

    if test -f $root/pnpm-lock.yaml
        pnpm nx $argv
    else if test -f $root/bun.lockb; or test -f $root/bun.lock
        bun nx $argv
    else if test -f $root/yarn.lock
        yarn nx $argv
    else if test -f $root/package-lock.json
        npx nx $argv
    else if type -q nx
        command nx $argv
    else
        npx nx $argv
    end
end
