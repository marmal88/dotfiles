require('marks').setup({
	mappings = {
		set_next = "m,", -- Set the next available alphabetical mark
		set = "m",     -- Used for 'mx' (set mark x)
		toggle = "m;", -- Toggle the next available mark
		delete = "dm", -- Used for 'dmx' (delete mark x)
		delete_line = "dm-", -- Delete all marks on current line
		delete_buf = "dm ", -- Delete all marks in current buffer (note the space)
		next = "m]",   -- Move to next mark
		prev = "m[",   -- Move to previous mark
		preview = "m:", -- Preview mark
		-- Bookmarks
		set_bookmark0 = "m0",
		delete_bookmark0 = "dm0",
		next_bookmark = "m}", -- Move to next bookmark of same type
		prev_bookmark = "m{", -- Move to previous bookmark of same type
		delete_bookmark = "dm=", -- Delete bookmark under cursor
	}
})
