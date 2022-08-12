#!/bin/sh
# :UpdateRemotePlugin output
rm -f "$HOME/.local/share/nvim/rplugin.vim"
# installed lsp's
rm -rf "$HOME/.local/share/nvim/lsp_servers"
# packer plugins
rm -f "$HOME/.local/share/nvim/site/plugin/packer_compiled.lua"
rm -rf "$HOME/.local/share/nvim/site/pack/packer"
