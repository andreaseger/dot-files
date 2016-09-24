my dot-files
===

Collection of dot-files for various tools likes:

- [fish]()
- [tmux]()
- [spacemacs]()
- [vim]()
- [git]()
- [ruby]()

This repo is compared to other dot-files repos build on the idea that your home directory is the dot-files repository itself.

Installation
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


[git]: https://git-scm.com
[ruby]: https://www.ruby-lang.org
[tmux]: https://tmux.github.io
[vim]: http://www.vim.org
[fish]: https://fishshell.com
[spacemacs]: http://spacemacs.org

