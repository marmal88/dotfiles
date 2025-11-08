-- Configs for diagnostics

-- Setup tiny-inline-diagnostics
require('tiny-inline-diagnostic').setup({
	preset = 'ghost',
	options = {
		add_messages = { display_count = true },
		show_source = { enabled = true },
		multilines = { enabled = true },
	},
	blend = { factor = 0.2 },
})

-- Disable native vim language diagnostics
vim.diagnostic.config( {
	underline = true,
	virtual_text = false,
	signs = {
		active = true,
		text = {
			[vim.diagnostic.severity.ERROR] = require('plugin.icons').diagnostics.ERROR,
			[vim.diagnostic.severity.WARN] = require('plugin.icons').diagnostics.WARN,
			[vim.diagnostic.severity.INFO] = require('plugin.icons').diagnostics.INFO,
			[vim.diagnostic.severity.HINT] = require('plugin.icons').diagnostics.HINT,
		},
	},
})
