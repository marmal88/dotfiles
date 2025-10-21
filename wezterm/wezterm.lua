local wezterm = require("wezterm")
local c = wezterm.config_builder()

-- font configs
c.font = wezterm.font { family = 'JetBrains Mono' }
c.font_size = 13.0
c.line_height = 1.2

-- colourscheme configs
c.color_scheme = 'kanagawa (Gogh)'

-- minimal tabs
c.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
c.window_background_opacity = 0.80
c.macos_window_background_blur = 20
c.initial_rows = 40
c.initial_cols = 180

-- Key bindings
c.leader = { key = 'x', mods = ' ' }
c.keys = {
    {
        key = 'q',
        mods = 'LEADER',
        action = wezterm.action.CloseCurrentPane { confirm = false },
    },
    {
        key = "%",
        mods = "LEADER",
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain'}
    },
    {
        key = '^',
        mods = 'LEADER',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain'}
    },
    {
        key = 'k',
        mods = 'CMD',
        action = wezterm.action.SendString 'clear\n'
    }
}

return c
