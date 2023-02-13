local ok, lspconfig = pcall(require, "mason-lspconfig")
if not ok then
  return
end

local server_list = { "clangd", "lua_ls", }
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "⧖",
      package_uninstalled = "✗"
    },
  },
})
lspconfig.setup({
  servers = server_list,
  automatic_installation = true,
})

local on_attach = function(client, bufnr)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- https://github.com/williamboman/nvim-lsp-installer/discussions/636
for _, lsp in ipairs(server_list) do
  require("lsp.servers." .. lsp).setup(on_attach, capabilities)
end

-- NOTE: no real reason to run this unless we're changing some setting
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, {
--     -- underline = true,
--     -- virtual_text = false,
--     -- signs = true,
--     -- update_in_insert = true,
--   }
-- )

local utils = require("utils")
for type, icon in pairs(utils.signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- NOTE: should probably convert this to using autocommands but it works for now
-- should also implement a setting somewhere in case I don't want undercurls
vim.cmd([[
   hi DiagnosticUnderlineError cterm=undercurl gui=undercurl guisp=Red
   hi DiagnosticUnderlineHint  cterm=undercurl gui=undercurl guisp=LightGrey
   hi DiagnosticUnderlineInfo  cterm=undercurl gui=undercurl guisp=LightBlue
   hi DiagnosticUnderlineWarn  cterm=undercurl gui=undercurl guisp=Orange
]])
