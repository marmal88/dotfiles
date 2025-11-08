return require('fzf-lua').setup{
	winopts = {
		anchor = 'NE',
		row = 0,
		col = 0,
		relative = 'editor',
		border = 'rounded',
		backdrop = 80,
		title_pos = 'left',
	},
	preview = {
		title_pos = 'left',
		winopts = {
			relativenumber = true,
			list = true
		}
	},
}
