-- Taken from nvim-lint
-- Linting
require('lint').linters_by_ft = {
	lua = {'luacheck'},
	python = { 'ruff' },
	markdown = { 'vale' }
}
