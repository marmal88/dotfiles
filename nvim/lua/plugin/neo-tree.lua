require('neo-tree').setup({
    position = 'float',
    filesystem = {
        follow_current_file = true,
        filtered_items = {
            visible = true,
            show_hidden_count = true,
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
                '.DS_Store'
            },
            never_show = {},
        },
    }
})
