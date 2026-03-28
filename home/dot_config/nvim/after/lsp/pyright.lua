-- vim.lsp.config('pyright', {})

return {
	cmd = { "pyright-langserver", "--stdio" },
	root_markers = { "pyrightconfig.json", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
	filetypes = { "python" },
}
