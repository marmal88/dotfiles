-- Configs for diagnostics

-- Language Diagnostics
vim.diagnostic.config( {
	underline = false, -- signs dont change unless underline changed to true
	virtual_lines = { current_line = false },
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
	},
})

