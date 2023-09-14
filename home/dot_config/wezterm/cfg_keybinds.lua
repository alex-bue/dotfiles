local wezterm = require 'wezterm'
local act = wezterm.action

local module = {}

function module.apply_to_config(config)
    config.keys = {

        -- Pane:
        -- Move around panes
        { key = 'H', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Left' },
        { key = 'L', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Right' },
        { key = 'K', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Up' },
        { key = 'J', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Down' },

        -- Rotate panes
        { key = 'J', mods = 'CTRL|SHIFT|SUPER', action = act.RotatePanes 'Clockwise' },
        { key = 'K', mods = 'CTRL|SHIFT|SUPER', action = act.RotatePanes 'CounterClockwise' },

        -- Resize panes
        { key = 'H', mods = 'SHIFT|ALT', action = act.AdjustPaneSize{ 'Left', 1 } },
        { key = 'L', mods = 'SHIFT|ALT', action = act.AdjustPaneSize{ 'Right', 1 } },
        { key = 'K', mods = 'SHIFT|ALT', action = act.AdjustPaneSize{ 'Up', 1 } },
        { key = 'J', mods = 'SHIFT|ALT', action = act.AdjustPaneSize{ 'Down', 1 } },

        -- New panes 
        { key = 'Enter', mods = 'CTRL|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }, },
        { key = 'Enter', mods = 'CTRL|SHIFT|SUPER', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }, },

        -- Close pane
        { key = 'w', mods = 'CTRL|SHIFT', action = wezterm.action.CloseCurrentPane { confirm = true } },

    }
end

return module
