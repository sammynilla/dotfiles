vim.api.nvim_create_autocmd({ "BufNewFile", "BufFilePre", "BufRead" }, {
  -- callback = function()
  --   vim.bo.cindent = false
  -- end,
  command = "set filetype=cpp",
  pattern = { "*.c,*.cpp" },
})
