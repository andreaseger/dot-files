# dot-files

Collection of my ever evolving dot-files.

## Installation / Bootstrap

```sh

curl -fsL https://up.a6.io | bash
# or
bash <(curl -fsL https://up.a6.io)
# or
wget -qO- https://up.a6.io | sh
```

### What bootstrap does

For details checkout `.local/bin/bootstrap-dotf`

1. check that an ssh key exists
2. install a couple system packages (OS agnostic archlinux, ubuntu, alpine, macOS/homebrew)
3. install [mise](https://mise.jdx.dev) to `~/.local/bin`
4. validate ssh-key setup for github
5. clone this dot-files repo as bare repo into `.local/share/dot-files.git`, set up remote tracking and checkout the default branch into `$HOME`
6. install the tools listed in `.config/mise/config.toml`
7. clone tmux plugins (resurrect, continuum) into `.config/tmux/plugins`
8. check that we're using fish shell

The script is idempotent, rerun it to update packages, mise tools and tmux plugins.

macOS and Arch Linux are the primary targets. Alpine and Debian/Ubuntu use
their standard packages: Neovim older than 0.11.2 loads `~/.vimrc` without
LazyVim, and older tmux versions skip unsupported optional settings. Bootstrap
does not add an Ubuntu Neovim PPA.

Noninteractive Fish commands (`fish -c`) load environment settings and mise
shims, but skip prompt/plugin setup, abbreviations and key bindings.

### Usage / Maintenance

The dot-files include the following alias / function for both bash and fish respectively.

```
dotf() {
  git --git-dir="$HOME/.local/share/dot-files.git/" --work-tree="$HOME" "$@"
}
```

So you can interact with it like with normal git just using `dotf` instead.
`dotf-up` rebases onto `origin/m`, `dotf-push` pushes.

Note: We set `dotf config status.showUntrackedFiles no`, so we're not seeing any untracked files.
Toggle with `dotf show-untracked` / `dotf hide-untracked`.

### Tools

Global CLI tools (kubectl, helm, sops, age, ...) are managed by mise via `.config/mise/config.toml`.

```sh
mise install              # install everything from the config
mise use -g node@lts      # add a tool
mise upgrade              # update all
```

## Highlights

- fish shell
- global git config
- mise for tool versions
- starship (*fish uses tide instead)
- tmux
- lazy.vim starter
- basic vim config
- bootstrap script
- dot-files should work on Ubuntu, Alpine, Archlinux & macOS

## MacOS things

```sh
brew install --cask \
  ghostty \
  rectangle \
  scroll-reverser

```
