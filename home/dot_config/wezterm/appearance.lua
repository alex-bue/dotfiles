local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	-- Set colour scheme
	config.color_scheme = "Catppuccin Frappe"

	-- Window
	config.window_close_confirmation = "NeverPrompt"
	config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
	config.window_background_opacity = 1
	config.window_padding = {
		left = "1cell",
		right = "1cell",
		top = "1.5cell",
		bottom = "0cell",
	}

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
end

return module
