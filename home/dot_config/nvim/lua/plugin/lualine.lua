-- Default lualine configurations
-- import icon pack
local icons = require('core.icons')

-- Linter progress
local lint_progress = function()
	local linters = require("lint").get_running()
	if #linters == 0 then
		return icons.misc.linter_active
	end
	return icons.misc.linter_searching .. table.concat(linters, ", ")
end

-- sidekick status
local sidekick_status = {
	function()
		return require('core.icons').misc.copilot
	end,
	color = function()
		local status = require('sidekick.status').get()
		local task = require('sidekick.status').cli()
		if status then
			if status.kind == "Error" then
				return { fg = "#cc6666" }
			end

			if status.busy or #task > 0 then
				return { fg = "#f0c674" }
			end
		end
		return { fg = "#81a2be" }
	end,
}

-- Configurations changed are commented
return require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'tomorrow_night', -- replaced auto
		component_separators = { left = icons.misc.component_separators_left, right = icons.misc.component_separators_right },
		section_separators = { left = icons.misc.section_separators_left, right = icons.misc.section_separators_right },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		always_show_tabline = true,
		globalstatus = false,
		refresh = {
			statusline = 100,
			tabline = 1000,
			winbar = 1000,
			refresh_time = 16, -- ~60fps
			events = {
				'WinEnter',
				'BufEnter',
				'BufWritePost',
				'SessionLoadPost',
				'FileChangedShellPost',
				'VimResized',
				'Filetype',
				'CursorMoved',
				'CursorMovedI',
				'ModeChanged',
			},
		}
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = { 'filename' },
		lualine_x = { 'encoding', 'filetype', 'progress' },
		lualine_y = { sidekick_status, lint_progress, 
			{
				'lsp_status',
				icon = '', -- f013
				symbols = {
					spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
					done = '✓',
					separator = ' ',
				},
				ignore_lsp = {},
				show_name = true,
			},
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = { 
		lualine_a = { 
			{
				'filename', path=1, 
				file_status=true, 
			} 
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}
