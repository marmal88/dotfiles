-- initiates packer and checks status
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- displays packer downloads as floating window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border ="rounded" }
        end,
    },
}

-- plugins install-- plugins install-- plugins install-- plugins install-- plugins install-- plugins install-- plugins install-- plugins install-- plugins install
return packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- theme and icon packs
    use ('rebelot/kanagawa.nvim')
    use ('DaikyXendo/nvim-material-icon')

    -- telescope
    use {
        'kevinhwang91/nvim-hlslens',
        'nvim-lua/popup.nvim',
        'nvim-telescope/telescope-media-files.nvim',
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
            requires = {{'nvim-lua/plenary.nvim'}}
    }

    -- statusline
    use("nvim-lualine/lualine.nvim")

    -- plugins
    use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use ('mbbill/undotree')
    use ('tpope/vim-fugitive')

    -- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

    -- cmp
    use'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- nvimtree
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    })

    -- IAC and Config Mgmt Plugins
    use("hashivim/vim-terraform")

end)
