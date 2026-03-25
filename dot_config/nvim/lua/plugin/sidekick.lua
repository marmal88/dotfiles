--
local sidekick_cli = require('sidekick.cli')
local sidekick_nes = require('sidekick.nes')

-- Set keymaps
vim.keymap.set({ "n", "t", "i", "x" }, "<c-.>", function() sidekick_cli.toggle() end,
	{ desc = "Sidekick Toggle" })
vim.keymap.set({ "n" }, "<leader>aa", function() sidekick_cli.toggle() end, { desc = "Sidekick Toggle CLI" })
vim.keymap.set({ "n" }, "<leader>as", function() sidekick_cli.select() end, { desc = "Select CLI" })
vim.keymap.set({ "n" }, "<leader>ad", function() sidekick_cli.close() end, { desc = "Detach a CLI Session" })
vim.keymap.set({ "x", "n" }, "<leader>at", function() sidekick_cli.send({ msg = "{this}" }) end, { desc = "Send This" })
vim.keymap.set({ "n" }, "<leader>af", function() sidekick_cli.send({ msg = "{file}" }) end, { desc = "Send File" })
vim.keymap.set({ "x" }, "<leader>av", function() sidekick_cli.send({ msg = "{selection}" }) end,
	{ desc = "Send Visual Selection" })
vim.keymap.set({ "x", "n" }, "<leader>ap", function() sidekick_cli.prompt() end, { desc = "Sidekick Select Prompt" })

-- NES suggestions
vim.keymap.set({ "n" }, "<C-l>", function() sidekick_nes.apply() end, { desc = "Accept NES" })

-- AI Models specifc keybindings
vim.keymap.set({ "n" }, "<leader>ao", function() sidekick_cli.toggle({ name = "opencode", focus = true }) end,
	{ desc = "Sidekick Toggle Opencode" })
vim.keymap.set({ "n" }, "<leader>ag", function() sidekick_cli.toggle({ name = "gemini", focus = true }) end,
	{ desc = "Sidekick Toggle Gemini" })

-- Env var
vim.env.GOOGLE_CLOUD_PROJECT = "dde-ops-data-science-d001"
vim.env.GOOGLE_CLOUD_LOCATION = "europe-west4"

return require('sidekick').setup({
	nes = {
		enabled = true,
		debounce = 75,
	},
	cli = {
		prompts = {
			diagnostics = "Can you help me fix the diagnostics in {file}?\n{diagnostics}",
			diagnostics_all = "Can you help me fix these diagnostics?\n{diagnostics_all}",
			document = "Add documentation to {function|line}",
			explain_line = "Explain {this} in detail:",
			quickfix = "{quickfix}",
			selection = "{selection}",
			["function"] = "{function}",
			class = "{class}",
			refactor = "Refactor {this} to be more readable",
		},
		win = {
			layout = "right",
			split = {
				width = 0.4,
				height = 1.0,
			}
		},
		default = "gemini",
	},
	keys = {
		hide_n      = { "q", "hide", mode = "n", desc = "hide the terminal window" },
		buffers     = { "<c-b>", "buffers", mode = "nt", desc = "open buffer picker" },
		files       = { "<c-f>", "files", mode = "nt", desc = "open file picker" },
		hide_ctrl_z = { "<c-z>", "blur", mode = "nt", desc = "go back to the previous window without hiding the terminal" },
		prompt      = { "<c-p>", "prompt", mode = "t", desc = "insert prompt or context" },
		stopinsert  = { "<c-q>", "stopinsert", mode = "t", desc = "enter normal mode" },
		nav_left    = { "<c-h>", "nav_left", expr = true, desc = "navigate to the left window" },
	},
})
