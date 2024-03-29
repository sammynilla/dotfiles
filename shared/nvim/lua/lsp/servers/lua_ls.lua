local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local settings = {
  Lua = {
    runtime = {
      version = "LuaJIT", path = runtime_path, },
    diagnostics = {
      globals = { "vim", },
      disable = {
        "lowercase-global",
        "undefined-global",
        "unused-local",
        "unused-function",
        "unused-vararg",
        "trailing-space",
      },
    },
    workspace = {
      library = vim.api.nvim_get_runtime_file("", true),
      checkThirdParty = false,
    },
    telemetry = { -- may not be necessary anymore
      enable = false,
    },
  },
}

local _M = {}
_M.setup = function(on_attach, capabilities)
  require("lspconfig").lua_ls.setup({
    on_attach = function(client, bufnr)
      client.server_capabilities.document_formatting = false
      client.server_capabilities.document_range_formatting = false
      on_attach(client, bufnr)
    end,
    settings = settings,
    capabilities = capabilities,
  })
end

return _M
