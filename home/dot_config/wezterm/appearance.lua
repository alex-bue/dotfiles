local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	-- Set colour scheme
	config.color_scheme = "catppuccin-frappe"

	-- Window
  config.window_close_confirmation = "NeverPrompt"
	config.window_decorations = "TITLE | RESIZE"
	config.window_background_opacity = 1

	-- Style inactive panes
	config.inactive_pane_hsb = {
		saturation = 0.9,
		brightness = 0.8,
	}

	-- Set cursor settings
	config.default_cursor_style = "BlinkingBlock"
	config.cursor_blink_ease_in = "Constant"
	config.cursor_blink_ease_out = "Constant"
	config.cursor_blink_rate = 700

	-- Tab bar
	config.hide_tab_bar_if_only_one_tab = true
	config.tab_bar_at_bottom = false

	-- Scrollback Buffer
	config.scrollback_lines = 5000

	-- Window frame fonnt and colour
	config.window_frame = {
		font = wezterm.font({ family = "JetBrains Mono", weight = "Bold" }),
		active_titlebar_bg = "#3B4252",
		inactive_titlebar_bg = "#3B4252",
	}

	-- Tab bar colors (only work with nord color scheme)
	config.colors = {
		tab_bar = {
			active_tab = {
				bg_color = "#2E3440",
				fg_color = "#ECEFF4",
			},

			inactive_tab = {
				bg_color = "#3B4252",
				fg_color = "#ECEFF4",
			},

			inactive_tab_hover = {
				bg_color = "#2E3440",
				fg_color = "#ECEFF4",
			},

			new_tab = {
				bg_color = "#3B4252",
				fg_color = "#ECEFF4",
			},

			new_tab_hover = {
				bg_color = "#2E3440",
				fg_color = "#ECEFF4",
			},

			inactive_tab_edge = "#ECEFF4",
		},
	}
end

return module
