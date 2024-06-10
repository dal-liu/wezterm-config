local wezterm = require("wezterm")

local mux = wezterm.mux

local config = wezterm.config_builder()

config.color_scheme = "Apple System Colors"

config.hide_tab_bar_if_only_one_tab = true

config.use_fancy_tab_bar = true

config.window_frame = {
	font_size = 14.0,
}

config.colors = {
	scrollbar_thumb = "#333333",

	tab_bar = {
		active_tab = {
			bg_color = "#1e1e1e",
			fg_color = "#c0c0c0",
		},
	},
}

config.window_padding = {
	left = 8,
	right = 14,
	top = 8,
	bottom = 8,
}

config.font = wezterm.font("JetBrainsMono Nerd Font")

config.font_size = 16.0

config.harfbuzz_features = { "zero" }

wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

wezterm.on("update-status", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	local dimensions = pane:get_dimensions()
	overrides.enable_scroll_bar = dimensions.scrollback_rows > dimensions.viewport_rows
	window:set_config_overrides(overrides)
end)

return config
