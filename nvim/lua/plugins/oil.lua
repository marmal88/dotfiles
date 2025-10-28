return require "oil".setup({
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	columns = { 
		"icon", 
		-- "permissions", 
		-- "size", 
		-- "mtime" 
	},
	view_options = {
		show_hidden = true,
	},
})
