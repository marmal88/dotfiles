local wezterm = require("wezterm")
local platform = require('utils.platform')
local c = wezterm.config_builder()

local mod = {}

if platform.is_mac then
   mod.SUPER = 'SUPER'
   mod.SUPER_REV = 'SUPER|SHIFT'
elseif platform.is_win or platform.is_linux then
   mod.SUPER = 'ALT' -- to not conflict with Windows key shortcuts
   mod.SUPER_REV = 'ALT|SHIFT'
end

-- font configs
c.font = wezterm.font { family = 'JetBrains Mono' }
c.font_size = 12.0
c.line_height = 1.2

-- colourscheme configs
c.color_scheme = 'kanagawa (Gogh)'

-- minimal tabs
c.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
c.window_background_opacity = 0.70
c.macos_window_background_blur = 5
c.initial_rows = 40
c.initial_cols = 180

-- Key bindings
c.keys = {
    {
        key = "\\",
        mods = mod.SUPER,
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain'}
    },
    {
        key = "]",
        mods = mod.SUPER_REV,
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain'}
    },
    {
        key = 'k',
        mods = mod.SUPER,
        action = wezterm.action.SendString 'clear\n'
    }
}

return c
