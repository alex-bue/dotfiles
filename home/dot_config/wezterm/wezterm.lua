-- Pull in the wezterm API
local wezterm = require 'wezterm'

local cfg_appearance = require 'cfg_appearance'
local cfg_fonts = require 'cfg_fonts'
local cfg_keybinds = require 'cfg_keybinds'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
cfg_appearance.apply_to_config(config)
cfg_fonts.apply_to_config(config)
cfg_keybinds.apply_to_config(config)

-- and finally, return the configuration to wezterm
return config
