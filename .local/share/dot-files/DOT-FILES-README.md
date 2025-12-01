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

1. Install a couple system packages (OS agnostic archlinux, ubuntu, alpine, macOS/homebrew)
2. install asdf
3. validate ssh-key setup for github
4. clone this dot-files repo as bare repo into .local/share/dot-files.git
5. checkout default branch into `$HOME`
6. check that we're using fish shell

### Usage / Maintenance

The dot-files include the following alias / function for both bash and fish respectively.

```
dotf() {
  git --git-dir=".local/share/dot-files.git/" --work-tree="$HOME" "$@"
}
```

So you can interact with it like with normal git just using `dotf` instead.

Note: We set `dotf config status.showUntrackedFiles no`, so we're not seeing any untracked files.

## Highlights

- fish shell
- global git config
- starship
- tmux
- lazy.nvim bootstrap
- basic vim config
- bootstrap script
- dot-files should work on Ubuntu, Alpine, Archlinux & macOS
