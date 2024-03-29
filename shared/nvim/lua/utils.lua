local _M = {}

-- _M.signs = { Error = "", Warn = "", Hint = "", Info = "" }
_M.signs = { Error = "e", Warn = "w", Hint = "h", Info = "i" }

_M.packer_lazy_load = function(plugin, timer)
  if plugin then
    timer = timer or 0
    vim.defer_fn(function()
      require("packer").loader(plugin)
    end, timer)
  end
end

return _M
