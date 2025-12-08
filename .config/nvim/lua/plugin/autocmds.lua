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
vim.api.nvim_create_autocmd('TextYankPost', {
	group = 'custom_buffer',
	desc = 'Highlight on Yank',
	callback = function()
		vim.highlight.on_yank({ timeout = 200 })
	end
})
