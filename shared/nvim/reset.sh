#!/bin/sh
# installed lsp's (mason installer)
rm -rf "$HOME/.local/share/nvim/mason"
# packer plugins
rm -f "$HOME/.local/share/nvim/site/plugin/packer_compiled.lua"
rm -rf "$HOME/.local/share/nvim/site/pack/packer"
