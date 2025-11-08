local wezterm = require('wezterm')
local platform = require('utils.platform')
local ssh = require('utils.ssh')
local c = wezterm.config_builder()

local mod = {}

if platform.is_mac then
   mod.SUPER = 'CTRL'
   mod.SUPER_REV = 'CTRL|SHIFT'
   c.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
elseif platform.is_win or platform.is_linux then
   mod.SUPER = 'ALT'
   mod.SUPER_REV = 'ALT|SHIFT'
   c.leader = { key = 'a', mods = 'ALT', timeout_milliseconds = 1000 }
end

-- font configs
c.font = wezterm.font {
	family = 'JetBrains Mono',
	harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }, -- disable ligatures 
}
c.font_size = 12.0
c.line_height = 1.2
c.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
c.scrollback_lines = 2000

-- colourscheme configs
c.color_scheme = 'kanagawa (Gogh)'

-- minimal tabs
c.window_decorations = 'INTEGRATED_BUTTONS|RESIZE' --INTEGRATED_BUTTONS|
c.window_background_opacity = 0.70
c.macos_window_background_blur = 5
c.initial_rows = 40
c.initial_cols = 180

-- Key bindings
c.keys = {
    -- General key bindings
    { key = ')', mods = 'LEADER', action = wezterm.action.ToggleFullScreen, desc = 'Shortcut to toggle fullscreen mode'},
    { key = 'k', mods = 'CMD', action = wezterm.action.SendString 'clear\n',  desc = 'Shortcut to clear text on screen'},
    --Panes
    { key = "_", mods = 'LEADER', action = wezterm.action.SplitPane { direction = 'Down', size = { Percent = 50 } }, desc = 'Shortcut for :split'},
    { key = "|", mods = 'LEADER', action = wezterm.action.SplitPane { direction = 'Right', size = { Percent = 50 } }, desc = 'Shortcut for :vsplit'},
    { key = '`', mods = mod.SUPER, action = wezterm.action.SplitPane { direction = 'Down', size = { Percent = 20 } }, desc = 'Smaller terminal for quick application commands'},
    { key = 'W', mods = mod.SUPER_REV, action = wezterm.action.CloseCurrentPane { confirm = false }, desc = 'Shortcut to close pane'},
    -- Tabs
    { key = 'w', mods = 'LEADER', action = wezterm.action.ShowTabNavigator, desc = 'Show Navigation for tabs'},
    { key = 'Q', mods = mod.SUPER_REV,  action = wezterm.action.CloseCurrentTab { confirm = false }, desc = 'Shortcut to close tabs'},
    -- Multiplexing
    { key = 'a', mods = 'LEADER', action = wezterm.action.AttachDomain 'jetson', desc = 'Attach to domain unix'},
    { key = 'd', mods = 'LEADER', action = wezterm.action.DetachDomain { DomainName = 'jetson' }, desc = 'Detach from domain unix'},
}

-- multiplexing
c.unix_domains = { { name = 'unix' } }
c.ssh_domains = ssh

return c
