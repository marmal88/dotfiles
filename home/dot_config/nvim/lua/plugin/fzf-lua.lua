return require('fzf-lua').setup {
	winopts = {
		relative = 'editor',
		border = 'rounded',
		backdrop = 80,
	},
	preview = {
		title_pos = 'left',
		winopts = {
			relativenumber = true,
			list = true
		}
	},
}
