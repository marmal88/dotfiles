-- Configs for diagnostics

-- import icon pack
local icons = require('core.icons')

-- Setup tiny-inline-diagnostics
require('tiny-inline-diagnostic').setup({
	preset = 'ghost', -- icons set to ghosts
	options = {
		add_messages = { display_count = true },
		show_source = { enabled = true },
		multilines = { enabled = true },
	},
	blend = { factor = 0.2 },
})

-- Disable native vim language diagnostics
vim.diagnostic.config({
	underline = true,
	virtual_text = false,
	signs = {
		active = true,
		text = {
			[vim.diagnostic.severity.ERROR] = icons.diagnostics.ERROR,
			[vim.diagnostic.severity.WARN] = icons.diagnostics.WARN,
			[vim.diagnostic.severity.INFO] = icons.diagnostics.INFO,
			[vim.diagnostic.severity.HINT] = icons.diagnostics.HINT,
		},
	},
})
