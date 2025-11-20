# dot-files

Collection of my ever evolving dot-files

## Installation / Bootstrap

```sh

curl -fsL https://yourdomain.com/up | bash
# or
bash <(curl -fsL https://yourdomain.com/up)
# or
wget -qO- https://yourdomain.com/up | sh
```

## Feature

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

### other things

- vendored copy of [tmux-cssh] (57d9634c3807f15ac6b94f98a206bdc9933f55e2)
- vendored copy of [nginx_ensite] (fa4d72ce1c0a490442c8474e9c8dc21ed52c93d0)

[git]: https://git-scm.com
[fish]: https://fishshell.com
[tmux-cssh]: https://github.com/dennishafemann/tmux-cssh
[nginx_ensite]: https://github.com/perusio/nginx_ensite
