-- Mini icons
require('mini.icons').setup()

-- local iconpack
local M = {}

--- Diagnostic severities.
M.diagnostics = {
	ERROR = '',
	WARN = '',
	HINT = '',
	INFO = '',
}

-- Debugger Points
M.debugger = {
	STOPPED = '',
	BREAKPOINT = '',
	BREAKPOINT_CONDITION = '',
}

--- For folding.
M.arrows = {
	right = '',
	left = '',
	up = '',
	down = '',
}

-- kinds
M.symbol_kinds = {
	Array = '󰅪',
	Class = '',
	Color = '󰏘',
	Constant = '󰏿',
	Constructor = '',
	Enum = '',
	EnumMember = '',
	Event = '',
	Field = '󰜢',
	File = '󰈙',
	Folder = '󰉋',
	Function = '󰆧',
	Interface = '',
	Keyword = '󰌋',
	Method = '󰆧',
	Module = '',
	Operator = '󰆕',
	Property = '󰜢',
	Reference = '󰈇',
	Snippet = '',
	Struct = '',
	Text = '',
	TypeParameter = '',
	Unit = '',
	Value = '',
	Variable = '󰀫',
}

--- Shared icons that don't really fit into a category.
M.misc = {
	bug = '',
	dashed_bar = '┊',
	ellipsis = '…',
	git = '',
	palette = '󰏘',
	robot = '󰚩',
	search = '',
	terminal = '',
	toolbox = '󰦬',
	vertical_bar = '│',
	folder_closed = '',
	folder_opened = '',
	fold_open = '',
	fold_closed = '',
	done = '✓',
	copilot = ' ',
	component_separators_left = '',
	component_separators_right = '',
	section_separators_left = '',
	section_separators_right = '',
	linter_active = '󰦕 ',
	linter_searching = '󱉶 ',
}

return M
