vim.loader.enable()

vim.o.title = true
vim.o.termguicolors = true
vim.o.winborder = "double"
vim.o.mouse = "niv"
vim.o.mousescroll = "ver:0,hor:0"
vim.o.number = true
vim.o.colorcolumn = "80"
vim.o.signcolumn = "yes"
vim.o.relativenumber = false
vim.o.tabstop = 2
vim.o.softtabstop = vim.o.tabstop
vim.o.shiftwidth = vim.o.tabstop
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.swapfile = false
vim.o.ignorecase = true
vim.o.smartcase = true

local disabled_providers = { "node", "perl", "python3", "ruby" }
for _, provider in ipairs(disabled_providers) do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end

vim.g.mapleader = " "
local keybind = vim.keymap.set
keybind("n", "<leader>o", ":update<CR> :source<CR>", { silent = true })
keybind("n", "<leader>w", ":write<CR>")
keybind("n", "<leader><CR>", ':let @/ =""<CR>', { silent = true })
keybind({ "n", "v", "x" }, "<leader>y", '"+y<CR>')
keybind({ "n", "v", "x" }, "<leader>d", '"+d<CR>')
keybind("v", "<", "<gv")
keybind("v", ">", ">gv")

vim.pack.add({
	{ src = "https://github.com/nyoom-engineering/oxocarbon.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
})

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.hl.on_yank()
	end,
	group = vim.api.nvim_create_augroup("YankHighlight", {}),
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
vim.cmd.set("completeopt+=noselect")

vim.api.nvim_create_autocmd("User", {
	pattern = "MasonToolsUpdateCompleted",
	callback = function()
		vim.schedule(function()
			vim.lsp.enable({ "clangd", "lua_ls" })
		end)
	end,
})

require("mason").setup({
	ui = {
		icons = {
			package_pending = " ",
			package_installed = " ",
			package_uninstalled = " ",
		},
	},
})
require("mason-tool-installer").setup({
	ensure_installed = {
		"clangd",
		"lua-language-server",
		"clang-format",
		"prettier",
		"stylua",
	},
})
require("conform").setup({
	formatters_by_ft = {
		c = { "clang-format" },
		-- cs = { "csharpier" },
		json = { "prettier" },
		lua = { "stylua" },
		markdown = { "prettier" },
	},
})
keybind("n", "<leader>lf", require("conform").format)

require("nvim-autopairs").setup()
require("mini.pick").setup()
keybind("n", "<leader>f", ":Pick files<CR>")
keybind("n", "<leader>h", ":Pick help<CR>")

vim.o.background = "light"
vim.cmd.colorscheme("oxocarbon")
vim.cmd.highlight("statusline guibg=NONE")
