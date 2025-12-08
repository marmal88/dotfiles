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

-- appearence configs
c.color_scheme = 'kanagawa (Gogh)'

-- random image generator
-- local background_dir = wezterm.config_dir .. "/background"
-- local images = wezterm.glob(background_dir .. "/*")
-- math.randomseed(os.time())
-- local selected_image = ""
-- if #images > 0 then
-- 	selected_image = images[math.random(#images)]
-- else
-- 	selected_image = nil
-- end
--
-- c.background = {
-- 	{
-- 		source = { File = selected_image },
-- 		opacity = 0.6,
-- 		hsb = {
-- 			hue = 1.0,
-- 			saturation = 0.5, -- 0.0 is black & white, 1.0 is normal
-- 			brightness = 0.8, -- Dim it down a bit
-- 		},
-- 		width = "100%",
-- 		height = "100%",
-- 	}
-- }

-- minimal tabs
c.window_decorations = 'INTEGRATED_BUTTONS|RESIZE' --INTEGRATED_BUTTONS|
c.window_background_opacity = 0.95
c.macos_window_background_blur = 5
c.initial_rows = 40
c.initial_cols = 180

-- Key bindings
c.keys = {
	-- General key bindings
	{ key = ')', mods = 'LEADER',      action = wezterm.action.ToggleFullScreen,                                           desc = 'Shortcut to toggle fullscreen mode' },
	{ key = 'k', mods = 'CMD',         action = wezterm.action.SendString 'clear\n',                                       desc = 'Shortcut to clear text on screen' },
	--Panes
	{ key = "_", mods = 'LEADER',      action = wezterm.action.SplitPane { direction = 'Down', size = { Percent = 50 } },  desc = 'Shortcut for :split' },
	{ key = "|", mods = 'LEADER',      action = wezterm.action.SplitPane { direction = 'Right', size = { Percent = 50 } }, desc = 'Shortcut for :vsplit' },
	{ key = '`', mods = mod.SUPER,     action = wezterm.action.SplitPane { direction = 'Down', size = { Percent = 20 } },  desc = 'Smaller terminal for quick application commands' },
	{ key = 'W', mods = mod.SUPER_REV, action = wezterm.action.CloseCurrentPane { confirm = false },                       desc = 'Shortcut to close pane' },
	-- Tabs
	{ key = 'w', mods = 'LEADER',      action = wezterm.action.ShowTabNavigator,                                           desc = 'Show Navigation for tabs' },
	{ key = 'Q', mods = mod.SUPER_REV, action = wezterm.action.CloseCurrentTab { confirm = false },                        desc = 'Shortcut to close tabs' },
	-- Multiplexing
	{ key = 'a', mods = 'LEADER',      action = wezterm.action.AttachDomain 'jetson',                                      desc = 'Attach to domain unix' },
	{ key = 'd', mods = 'LEADER',      action = wezterm.action.DetachDomain { DomainName = 'jetson' },                     desc = 'Detach from domain unix' },
}

-- multiplexing
c.unix_domains = { { name = 'unix' } }
c.ssh_domains = ssh

-- cursor style
c.default_cursor_style = "SteadyBlock"

return c
