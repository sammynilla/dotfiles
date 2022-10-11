local installed_languages = {
  "bash", "cpp", "lua", "markdown", "vim",
}

require("nvim-treesitter.configs").setup({
  ensure_installed = installed_languages,
  highlight = { enable = true, },
  indent = {
    enable = true,
    disable = { "yaml", },
  },
  playground = { enable = true, },
  autotag = { enable = true, },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})
