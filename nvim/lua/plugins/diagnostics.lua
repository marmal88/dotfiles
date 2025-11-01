-- Configs for diagnostics

-- Disable native vim language diagnostics
vim.diagnostic.config( {
	underline = true, -- signs dont change unless underline changed to true
	virtual_lines = { current_line = false },
	virtual_text = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
	},
})

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
