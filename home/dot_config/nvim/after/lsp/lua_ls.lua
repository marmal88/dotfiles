local root_markers1 = {
	'.emmyrc.json',
	'.luarc.json',
	'.luarc.jsonc',
}

local root_markers2 = {
	'.luacheckrc',
	'.stylua.toml',
	'stylua.toml',
	'selene.toml',
	'selene.yml',
}

---@type vim.lsp.Config
return {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = vim.fn.has('nvim-0.11.3') == 1 and { root_markers1, root_markers2, { '.git' } }
		or vim.list_extend(vim.list_extend(root_markers1, root_markers2), { '.git' }),
	---@type lspconfig.settings.lua_ls
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" }, },
			workspace = {
				checkThirdParty = false,
				library = { vim.env.VIMRUNTIME },
			},
			codeLens = { enable = true },
			hint = { enable = true, semicolon = 'Disable' },
		},
	},
	handlers = {
		--- filter noisy notifications
		['$/progress'] = function(err, result, ctx)
			-- just notify once
			if result.token == (vim.g.basedpyright_progress_token or result.token) then
				vim.g.basedpyright_progress_token = result.token
				vim.lsp.handlers['$/progress'](err, result, ctx)
			end
		end,
	},
}
