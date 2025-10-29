local wezterm = require('wezterm')

local events = {}

function events.setup()
  -- EVENT LISTENER FOR RENAMING THE WORKSPACE
  wezterm.on('rename-workspace', function(window, line)
    if line then
      wezterm.mux.rename_workspace(window:mux_window():get_workspace(), line)
    end
  end)
end

return events
