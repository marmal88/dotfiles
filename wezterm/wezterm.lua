local wezterm = require("wezterm")
local c = wezterm.config_builder()

-- font configs
c.font = wezterm.font {
  family = 'JetBrains Mono',
  weight = 'Medium',
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }, -- disable ligatures
}
c.font_size = 12.0
c.line_height = 1.0

-- colourscheme configs
c.color_scheme = 'kanagawa'

-- minimal tabs
c.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
c.window_background_opacity = 0.70
c.macos_window_background_blur = 20

return c
