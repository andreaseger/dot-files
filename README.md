dot-files
===

Collection of my ever evolving dot-files

[Installation](https://gist.github.com/andreaseger/5317eafc7eab57bc238fc2f9fe1b431c)
---

```sh
# install starship https://github.com/starship/starship
curl -sS https://starship.rs/install.sh | sh
```

```sh
# init home directory
git clone git@github.com:andreaseger/dot-files.git /tmp/dot-files --no-checkout
mv /tmp/dot-files/.git ~/.git
rm /tmp/dot-files -rf
cd ~
git reset HEAD
git checkout .
git submodule update --init
```


Feature
---

highlighting some features of my dot-files

### setup

My homedir is itself the dot-files repository. No need for any symlinks or other
install scripts which keep the symlinks intact. An extensive gitignore file which
is switched to whitelisting files/folders is used instead.

### [fish]

my shell of choice with

- environment/host specific shell setup
- many helper functions and git abbreviations

### [git]

- template with hooks for ctag generation
- lost of useful config
- various aliases for logs and other things

### vim

well maintained minimal config without external dependencies for good enough shell
use or to copy to root (`sudo cp .vim* /root/ -R`)

### [ruby]

[rbenv] is included as submodule in `.rbenv` also an alias to install rubies with
[ruby-install] for rbenv is included

```
wget -O ruby-install-0.7.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.7.0.tar.gz
tar -xzvf ruby-install-0.7.0.tar.gz
cd ruby-install-0.7.0/
env PREFIX=~/.local make install
```

### rust, exa, bat

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install exa
cargo install bat
```

### other things

- vendored copy of [tmux-cssh] (57d9634c3807f15ac6b94f98a206bdc9933f55e2)
- vendored copy of [nginx_ensite] (fa4d72ce1c0a490442c8474e9c8dc21ed52c93d0)

[git]: https://git-scm.com
[ruby]: https://www.ruby-lang.org
[tmux]: https://tmux.github.io
[fish]: https://fishshell.com
[ruby-install]: https://github.com/postmodern/ruby-install
[rbenv]: https://github.com/rbenv/rbenv
[tmux-cssh]: https://github.com/dennishafemann/tmux-cssh
[nginx_ensite]: https://github.com/perusio/nginx_ensite
