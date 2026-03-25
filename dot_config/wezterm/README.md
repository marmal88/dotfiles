# Configurations for Wezterm


## Keybindings
LEADER = `CTRL-A`
Toggle maximize window `LEADER-)`

## Tabs
- Tabs are the same as windows in Tmux
- Close current tab `LEADER-SHIFT-w`
- Tabs are created using `CTRL-SHIFT-TAB` or `CMD-t`
- Tab navigation
    - Call tab navigator using `LEADER-w`
    - Tabs are cycled using `CTRL-pageup` or `CTRL-pagedown` or via the `CMD-{tab-number}`

## Panes
- Panes are the same as
- Close current Pane `LEADER-SHIFT-q`
- Panes are created using `LEADER-SHIFT-\` (Vertical) or `LEADER-SHIFT-_` (Horizontal)
- Panes are cycled using `CTRL-SHIFT-{Left-Arrow}` or `CTRL-SHIFT-{Right-Arrow}`

## Multiplexing
- Domains are stored in utils under file `ssh.lua` 
