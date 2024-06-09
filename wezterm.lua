local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Apple System Colors"

config.window_frame = {
	-- The size of the font in the tab bar.
	font_size = 14.0,
}

config.colors = {
	-- The color of the scrollbar "thumb"; the portion that represents the current viewport
	scrollbar_thumb = "#333333",

	tab_bar = {
		-- The active tab is the one that has focus in the window
		active_tab = {
			-- The color of the background area for the tab
			bg_color = "#1e1e1e",
			-- The color of the text for the tab
			fg_color = "#c0c0c0",
		},

		new_tab_hover = {
			bg_color = "#333333",
			fg_color = "#c0c0c0",
		},
	},
}

config.enable_scroll_bar = true
config.window_padding = {
	left = 8,
	right = 14,
	top = 8,
	bottom = 8,
}

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 16.0

-- Use this for a zero with a line through it rather than a dot
config.harfbuzz_features = { "zero" }

-- Replace title bar with tab bar
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"

-- Disable scroll bar when in alt screen mode
wezterm.on("update-status", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	overrides.enable_scroll_bar = not pane:is_alt_screen_active()
	window:set_config_overrides(overrides)
end)

return config
