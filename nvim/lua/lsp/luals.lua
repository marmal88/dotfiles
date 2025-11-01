vim.lsp.config( 'luals', {
	cmd = {'lua-language-server'},
	filetypes = {'lua'},
	settings = {
		Lua = {
			runtime = { version = 'LuaJIT' },
			diagnostics = { globals = {'vim'},
		},
		telemetry = { enable = false },
		workspace = {
			checkThirdParty = false,
			library = { vim.env.VIMRUNTIME },
			},
		},
	},
})
