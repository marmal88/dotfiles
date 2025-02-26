return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    extensions = {
        fzf = {}
    },
    keys = {
        -- file search 
        vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files),
        vim.keymap.set('n', '<leader>fc', function()
            local opts = require('telescope.themes').get_ivy({
                cwd = vim.fn.stdpath('config')
            })
            require('telescope.builtin').find_files(opts) end),
        vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags),
        vim.keymap.set('n', '<leader>fb','<cmd>Telescope buffers sort_mru=true sort_lastused=true ignore_current_buffer=true<cr>'),
        -- git telescope
        vim.keymap.set('n', '<leader>gb', require('telescope.builtin').git_branches ),
        vim.keymap.set('n', '<leader>gc', require('telescope.builtin').git_commits ),
        vim.keymap.set('n', '<leader>gs', require('telescope.builtin').git_stash )
    },
    opts = {
        defaults = {
            layout_strategy = 'horizontal',
            layout_config = { prompt_position = 'top' },
            sorting_strategy = 'ascending',
            winblend = 0,
        },
    },
}
