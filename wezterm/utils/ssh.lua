local wezterm = require('wezterm')
local c = wezterm.config_builder()

c.ssh_domains = {
  {
    -- This name identifies the domain
    name = 'jetson',
    -- The hostname or address to connect to. Will be used to match settings
    -- from your ssh config file
    remote_address = '100.76.142.12',
    -- The username to use on the remote host
    username = 'dan',
  },
}
