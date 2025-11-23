vim.api.nvim_create_autocmd({ "BufNewFile", "BufFilePre", "BufRead" }, {
	pattern = { "*.gbasm", "*.gbz80", "*.inc" },
	callback = function()
		vim.cmd.set("filetype=gbz80")
		vim.cmd.set("commentstring=;\\ %s")
	end,
})
