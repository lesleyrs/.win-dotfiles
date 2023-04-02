-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Konsolas'
wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)
config.default_prog = { 'pwsh.exe' }
config.default_cwd = wezterm.home_dir .. '/Documents'
config.keys = {
  { key = 'w', mods = 'CTRL|SHIFT', action = 'DisableDefaultAssignment', },
  { key = 'w', mods = 'CTRL|SHIFT', action = wezterm.action.CloseCurrentPane { confirm = true },},
  { key = 'UpArrow', mods = 'SHIFT', action = wezterm.action.ScrollByLine(-3) },
  { key = 'DownArrow', mods = 'SHIFT', action = wezterm.action.ScrollByLine(3) },
}
config.adjust_window_size_when_changing_font_size = false
config.use_fancy_tab_bar = false
config.enable_tab_bar = false
-- config.enable_kitty_keyboard = true
-- config.use_dead_keys = false
-- config.enable_scroll_bar = true
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
