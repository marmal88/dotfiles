local wezterm = require("wezterm")
local platform = require('utils.platform')
local c = wezterm.config_builder()

local mod = {}

if platform.is_mac then
   mod.SUPER = 'CTRL'
   mod.SUPER_REV = 'CMD|SHIFT'
elseif platform.is_win or platform.is_linux then
   mod.SUPER = 'ALT'
   mod.SUPER_REV = 'ALT|SHIFT'
end

-- font configs
c.font = wezterm.font { family = 'JetBrains Mono' }
c.font_size = 12.0
c.line_height = 1.2
c.window_padding = { left = 0, right = 1, top = 0, bottom = 0 }

-- colourscheme configs
c.color_scheme = 'kanagawa'

-- minimal tabs
c.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
c.window_background_opacity = 0.70
c.macos_window_background_blur = 5
c.initial_rows = 40
c.initial_cols = 180

-- Key bindings
c.keys = {
    { key = '0', mods = mod.SUPER, action = wezterm.action.ToggleFullScreen, desc = 'Shortcut to toggle fullscreen mode'},
    { key = 'w', mods = mod.SUPER, action = wezterm.action.CloseCurrentPane { confirm = false }, desc = 'Shortcut to close pane'},
    { key = 'q', mods = mod.SUPER,  action = wezterm.action.CloseCurrentTab { confirm = false }, desc = 'Shortcut to close tabs'},
    { key = '`', mods = mod.SUPER, action = wezterm.action.SplitPane { direction = 'Down', size = { Percent = 20 } }, desc = 'Smaller terminal for quick application commands'},
    { key = "\\", mods = mod.SUPER, action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain'}, desc = 'Shortcut for :split'},
    { key = "]", mods = mod.SUPER, action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain'}, desc = 'Shortcut for :vsplit'},
    { key = 'k', mods = 'CMD', action = wezterm.action.SendString 'clear\n',  desc = 'Shortcut to clear text on screen'},
}

return c
