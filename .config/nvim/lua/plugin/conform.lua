-- Formatter
return require('conform').setup({
	formatters_by_ft = {
		lua = { 'stylua' },
		python = { 'ruff', 'mypy' },
		toml = { 'taplo' },
		yaml = { 'prettier' },
		json = { 'prettier' }
	},
	format_on_save = {
		lsp_format = "fallback",
		timeout_ms = 500,
	},
})
