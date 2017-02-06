# Installation for Mac

## Python

1. `brew install python` or `brew upgrade python` if you have an old version.

## Install Ensime (for scala development)

1. `pip2 install neovim`
2. `pip2 install sexpdata websocket-client`
3. Install ensime for your build tool. For SBT see here: http://ensime.org/build_tools/sbt/
4. Remember to add .ensime and .ensime_cache to .gitignore in your project.
5. In sbt for your project run `ensimeConfig`
6. Run `:UpdateRemovePlugin` from nvim and restart.
7. When you start your project the first time, run `:EnInstall`, which should spawn a background service.

### Troubleshooting

Read up on the vim pages here: http://ensime.org/editors/vim/workflow/

## Install NeoVim

1. https://github.com/neovim/neovim/wiki/Installing-Neovim
2. alias vim=nvim
3. On startup, nvim will ask you to install bundles, select "y" and the installation starts. It can take a while.
4. YouCompleteMeNow fails on the first install. That is ok, just restart. 

## Install Exuberant Ctags 

1. brew install ctags
2. alias ctags="\`brew --prefix\`/bin/ctags"
