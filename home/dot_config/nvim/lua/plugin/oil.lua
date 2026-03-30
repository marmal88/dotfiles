local oil = require("oil")

-- automatically open previewer
vim.api.nvim_create_autocmd("User", {
	pattern = "OilEnter",
	callback = vim.schedule_wrap(function(args)
		local win = vim.api.nvim_get_current_win()
		local config = vim.api.nvim_win_get_config(win)
		local is_floating = config.relative ~= "" -- config relative is "" for non-floating windows

		if is_floating then
			if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
				oil.open_preview({ vertical = true, split = 'botright' })
			end
		end
	end),
})

-- keymaps
vim.keymap.set('n', '<leader>E', '<CMD>Oil<CR>', { desc = 'File explorer' })
vim.keymap.set("n", "<leader>e", function() oil.toggle_float('.') end, { desc = "Toggle Oil in float" })

return require "oil".setup({
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	float = {
		max_width = 0.8,
		max_height = 0.8,
		padding = 2,
		border = "single",
		win_options = { winblend = 20 },
		preview_split = "below",
	},
	preview = {
		max_width = 0.9,
		min_width = 0.4,
		width = nil,
		max_height = 0.9,
		min_height = 0.4,
		height = nil,
		border = "single",
		win_options = { winblend = 20 }, -- window transparency
		update_on_cursor_move = true,
	},
	keymaps = {
		["<C-p>"] = "actions.preview", -- Press Ctrl+p to open the previewer
		["<Esc>"] = "actions.close",
		["q"] = "actions.close",
	},
	columns = {
		"icon",
		"permissions",
		"size",
		"mtime"
	},
	view_options = {
		show_hidden = true,
	},
})
