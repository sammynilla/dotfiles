vim.api.nvim_create_autocmd({ "BufNewFile", "BufFilePre", "BufRead" }, {
	pattern = { "*.asm", "*.inc" },
	callback = function()
		vim.cmd.set("commentstring=;\\ %s")
	end,
})
