local fn = vim.fn
local execute = vim.api.nvim_command

local PACKER_BOOTSTRAP = nil
local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  fn.delete(install_path, "rf")
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

-- packer as an optional package requires the use of packadd to function
execute("packadd packer.nvim")

-- handle edge-case where initial startup happens without a connection
local has_packer, packer = pcall(require, "packer")
if not has_packer then
  return
end

function default_package_setup(package_id, config)
  local ok, package = pcall(require, package_id)
  if ok then
    if config then
      package.setup(config)
      return
    end
    package.setup()
  end
end

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end,
    prompt_border = "single",
  },
  git = { clone_timeout = 600, },
  autoremove = true, -- remove disabled or unused plugins without a prompt
  compile_path = fn.stdpath("data") .. "/site/plugin/packer_compiled.lua",
})

return packer.startup(function(use)
  use ({ "wbthomason/packer.nvim", opt = true })
  use ({ "lewis6991/impatient.nvim" })
  use ({ "nvim-lua/plenary.nvim" })

  -- [[ user interface ]] --
  use ({
    "nvim-telescope/telescope.nvim", tag = "0.1.0",
    requires = { "nvim-lua/plenary.nvim" },
  })

  -- [[ syntax ]] --
  use ({
    "nvim-treesitter/nvim-treesitter", event = { "BufRead", "BufNewFile" },
    run = function() require("plugins.configs.nvim-treesitter") end,
    config = function() require("plugins.configs.nvim-treesitter") end,
  })
  use ({ "windwp/nvim-ts-autotag", after = "nvim-treesitter", })
  use ({
    "JoosepAlviste/nvim-ts-context-commentstring",
    after = "nvim-treesitter",
  })
  -- use ({ "nvim-treesitter/playground", after = "nvim-treesitter", })
  use ({
    "preservim/vim-markdown",
    config = function() require("plugins.configs.markdown") end,
  })
  use ({ "vim-pandoc/vim-pandoc-syntax" })

  -- [[ utilities ]] --
  use ({ "kevinhwang91/nvim-hlslens", event = "CmdlineEnter", })
  use ({
    "windwp/nvim-autopairs", event = "InsertEnter",
    config = function() default_package_setup("nvim-autopairs") end,
  })
  -- use ({ "yaocccc/nvim-hlchunk", event = "BufRead", })
  use ({ -- TODO: look over the configurations for this
    "norcalli/nvim-colorizer.lua", event = "BufRead",
    config = function() default_package_setup("colorizer") end,
  })
  use ({ -- peek and jump to line numbers
    "nacro90/numb.nvim", event = "CmdlineEnter",
    config = function() default_package_setup("numb") end,
  })
  use ({ "junegunn/limelight.vim", event = "CmdlineEnter", })

  -- [[ lsp ]] --
  use ({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  })
  use ({
    "neovim/nvim-lspconfig", after = "mason-lspconfig.nvim",
    config = function() require("lsp") end
  })

  -- [[ comment ]] --
  use ({ "tpope/vim-commentary", event = "BufRead", })

  -- [[ completion ]] --
  use ({
    "hrsh7th/nvim-cmp", event = "InsertEnter", module = "cmp_nvim_lsp",
    config = function() require("plugins.configs.cmp") end,
  })
  use ({ "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua", })
  use ({ "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip", })
  use ({ "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp", })
  use ({ "saadparwaiz1/cmp_luasnip", after = "LuaSnip", })

  -- [[ snippets ]] --
  use ({ "L3MON4D3/LuaSnip", after = "nvim-cmp", })

  -- [[ git ]] --
  use ({ "tpope/vim-fugitive" })
  use ({
    "junegunn/gv.vim", event = "CmdlineEnter",
    requires = { "tpope/vim-fugitive" },
  })
  use ({
    "tpope/vim-rhubarb",
    requires = { "tpope/vim-fugitive" },
  })
  use ({
    "lewis6991/gitsigns.nvim", opt = true,
    setup = function() require("utils").packer_lazy_load("gitsigns.nvim") end,
    config = function() require("plugins.configs.gitsigns") end,
  })

  -- auto-sync when packer first gets bootstrapped
  if PACKER_BOOTSTRAP ~= nil then
    packer.sync()
    PACKER_BOOTSTRAP = nil
  end
end)
