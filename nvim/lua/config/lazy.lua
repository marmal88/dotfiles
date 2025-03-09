-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.runtimepath:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
        { 'kyazdani42/nvim-web-devicons' },
        { 'DaikyXendo/nvim-material-icon' },
        { 'rebelot/kanagawa.nvim',  config = function() vim.cmd.colorscheme "kanagawa" end },
	    { import = "plugins" },
        { import = "plugins.lsp"},
        { import = "plugins.git"},
        { import = "plugins.ide"},
	},
	defaults = {
		lazy = false,   -- sets custom plugins to be lazy loaded by default
		version = false -- uses latest git commit
	},
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = true,
		notify = false, -- get a notification when changes are found
	},
})

