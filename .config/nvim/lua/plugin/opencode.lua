vim.g.opencode_opts = {
	provider = {
		enabled = "wezterm",
		wezterm = {
			direction = "right",
			top_level = true,
			percent = 40,
		},
	}
}
-- allow automatic reloading of files
vim.o.autoread = true

-- Keybindings
local os = require('opencode')

-- main functions
vim.keymap.set({ "n", "t" }, "<leader>oo", function() os.toggle() end, { desc = "Toggle opencode" })
vim.keymap.set({ "n", "x" }, "<leader>ou", function() os.command("agent.cycle") end, { desc = "Toggle Agent" })
vim.keymap.set({ "n", "x" }, "<leader>os", function() os.select() end, { desc = "Execute opencode action…" })

-- QnA functions
vim.keymap.set({ "n", "x" }, "<leader>oa", function() os.ask(" ", { submit = true }) end, { desc = "Ask" })
vim.keymap.set({ "n", "x" }, "<leader>ot", function() os.ask("@this: ", { submit = true }) end, { desc = "Ask select" })
vim.keymap.set({ "n", "x" }, "<leader>ob", function() os.ask("@buffer: ", { submit = true }) end, { desc = "Ask buffer" })

-- session management
vim.keymap.set({ "n", "x" }, "<leader>on", function() os.command("session.new") end, { desc = "Open new session" })
vim.keymap.set({ "n", "x" }, "<leader>oi", function() os.command("session.interrupt") end, { desc = "Interrupt session" })
vim.keymap.set({ "n", "x" }, "<leader>ol", function() os.command("session.list") end, { desc = "List all sessions" })

vim.keymap.set("n", "<PageUp>", function() os.command("session.half.page.up") end, { desc = "half page up" })
vim.keymap.set("n", "<PageDown>", function() os.command("session.half.page.down") end, { desc = "half page down" })
