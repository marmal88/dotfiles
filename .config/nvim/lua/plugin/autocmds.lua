-- Autosave
-- vim.api.nvim_create_augroup('Autosave', { clear = true }) -- autocommand for autosave
-- vim.api.nvim_create_autocmd({'BufwritePost', ''}, {
-- 	group = 'Autosave',
-- 	callback = function()
-- 		vim.
-- 	end
-- })


-- Buffer autocommands
vim.api.nvim_create_augroup('custom_buffer', { clear = true })
vim.api.nvim_create_autocmd('TermOpen', {
	group = 'custom_buffer',
	desc = 'Insert on terminal creation',
	command = 'startinsert | set winfixheight'
})

-- text highlighting on yank
vim.api.nvim_create_autocmd('TextYankPost', {
	group = 'custom_buffer',
	desc = 'Highlight on Yank',
	callback = function()
		vim.highlight.on_yank({ timeout = 200 })
	end
})

-- disable semantic tokens (prevent terraform freezing)
-- Uses treesitter instead of LSP to identify structure
vim.api.nvim_create_autocmd("LspAttach", {
	pattern = "terraformls",
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client then
			client.server_capabilities.semanticTokensProvider = nil
		end
	end,
})
