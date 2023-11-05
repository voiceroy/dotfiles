local wezterm = require "wezterm"

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.default_prog = {"/usr/bin/zellij"}
config.font = wezterm.font "Iosevka Term"
config.font_size = 14
config.color_scheme = "Gruvbox dark, hard (base16)" 
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0
}
config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = false
config.tab_max_width = 32
config.hide_tab_bar_if_only_one_tab = true
config.front_end = "OpenGL"
config.inactive_pane_hsb = {
  saturation = 0.5,
  brightness = 0.5
}

return config
