vim.pack.add({
	{ src = 'https://github.com/nvim-mini/mini.icons',       desc = 'Icon pack' },
	{ src = 'https://github.com/nvim-mini/mini.snippets',    desc = 'Snippet Manager' },
	{ src = 'https://github.com/nvim-mini/mini.indentscope', desc = 'Indent' },
	{ src = 'https://github.com/nvim-mini/mini.notify',      desc = 'Notification' },
	{ src = 'https://github.com/nvim-mini/mini.pick',        desc = 'Picker mini' },
	{ src = 'https://github.com/nvim-mini/mini.pairs',       desc = 'Autopairs' },
})

-- Config: mini pairs config
require('mini.pairs').setup({
	modes = {
		insert = true,
		command = false,
		terminal = false
	}
})

-- Config: mini pick
require('mini.pick').setup({
	sources = {
		files = {
			hidden = true,
		}
	},
	window = {
		config = nil
	},
	options = {
		content_from_bottom = false
	}
})

-- Config: mini snippets
require('mini.snippets').setup({
	snippets = {
		require('mini.snippets').gen_loader.from_file(vim.fn.stdpath('config') .. '/snippets/global.json'),
		require('mini.snippets').gen_loader.from_lang(),
	},
})

-- Config: mini indentscope
require('mini.indentscope').setup({ symbol = '│' })

-- Confgi: mini notification
require('mini.notify').setup({
	lsp_progress = {
		enable = true,
		level = 'INFO',
		duration_last = 100000,
	}
})
