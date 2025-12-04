-- taken from rust: https://docs.astral.sh/ruff/editors/setup/#neovim

return {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
	settings = {
		lint = { 'E', 'F', "I", 'N' },
		format = {
			quote_style = "double",
			indent_style = "space",
			skip_magic_trailing_comma = false,
			line_ending = "auto"
		}
	}
}
