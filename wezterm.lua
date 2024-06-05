-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Apple System Colors"

config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_frame = {
	-- The size of the font in the tab bar.
	-- Default to 10.0 on Windows but 12.0 on other systems
	font_size = 14.0,
}

config.colors = {
	tab_bar = {
		-- The active tab is the one that has focus in the window
		active_tab = {
			-- The color of the background area for the tab
			bg_color = "#1e1e1e",
			-- The color of the text for the tab
			fg_color = "#c0c0c0",
		},
	},
}

config.enable_scroll_bar = true
config.window_padding = {
	left = 8,
	right = 12,
	top = 4,
	bottom = 4,
}

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 16.0
config.harfbuzz_features = { "zero" }

-- and finally, return the configuration to wezterm
return config
