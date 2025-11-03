-- taken from rust: https://docs.astral.sh/ruff/editors/setup/#neovim

vim.lsp.config('ruff', {
	-- allow ruff to pick up from native environment
	-- init_options = {
	-- 	settings = {
	-- 		lint = { 'E', 'F', "I", 'N' },
	-- 		format = {
	-- 			quote_style = "double",
	-- 			indent_style = "space",
	-- 			skip_magic_trailing_comma = false,
	-- 			line_ending = "auto"
	-- 		}
	-- 	}
	-- },
})

