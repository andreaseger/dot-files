dot-files
===

Collection of my ever evolving dot-files

[Installation](https://gist.github.com/andreaseger/5317eafc7eab57bc238fc2f9fe1b431c)
---

```sh
git clone https://github.com/andreaseger/dot-files /tmp/dot-files --no-checkout
mv /tmp/dot-files/.git ~/.git
rm /tmp/dot-files -rf
cd ~
git reset HEAD
git checkout .
git submodule update --init
```

Features
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

### [spacemacs]

pretty standard spacemacs setup using evil. Some custom config regarding word
boundaries and other minor things.

- spacemacs is included as submodule in `.emacs.d`
- systemd user service for emacs as deamon is included
- snippets for ruby

### [git]

- template with hooks for ctag generation
- lost of useful config
- various aliases for logs and other things

### vim

well maintained minimal config without external dependencies for when emacs is
overkill or to copy to root (`sudo cp .vim* /root/ -R`)

(currently migrating more and more to using emacs/spacemacs everywhere)

### [ruby]

[rbenv] is included as submodule in `.rbenv` also an alias to install rubies with
[ruby-install] for rbenv is included
(
### other things

- vendored copy of [tmux-cssh] (57d9634c3807f15ac6b94f98a206bdc9933f55e2)
- vendored copy of [nginx_ensite] (fa4d72ce1c0a490442c8474e9c8dc21ed52c93d0)

TODO:
---

- backup scripts(tarsnap)
- add/improve environment/host specific config (e.g. for spacemacs)
- sort/maintain yasnippets for ruby & rspec

[git]: https://git-scm.com
[ruby]: https://www.ruby-lang.org
[tmux]: https://tmux.github.io
[fish]: https://fishshell.com
[spacemacs]: http://spacemacs.org
[ruby-install]: https://github.com/postmodern/ruby-install
[rbenv]: https://github.com/rbenv/rbenv
[tmux-cssh]: https://github.com/dennishafemann/tmux-cssh
[nginx_ensite]: https://github.com/perusio/nginx_ensite
