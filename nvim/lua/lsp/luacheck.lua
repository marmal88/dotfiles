vim.lsp.config( 'luacheck', {
	cmd = { 'luacheck'},
	settings = {
		diagnostics = { globals = { 'vim'}}
	}
})

