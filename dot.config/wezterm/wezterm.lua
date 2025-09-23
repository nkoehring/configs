local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- Make sure that wezterm starts inside the right environment on Windows
-- config.default_domain = 'WSL:archlinux'

config.color_scheme = 'Ashes (base16)'
config.font = wezterm.font('Monofur Nerd Font')
config.font_size = 14.0
config.freetype_load_target = "Light"

config.audible_bell = "Disabled"
config.visual_bell = {
  fade_in_duration_ms = 200,
  fade_out_duration_ms = 200,
}
config.colors = {
  visual_bell = '#202040',
}

config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.prefer_to_spawn_tabs = true

config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 2500 }
config.keys = {
  {
    key = 'F11',
    action = act.ToggleFullScreen,
  },
  -- feel more like tmux, please
  {
    mods = "LEADER",
    key = 'c',
    action = act.SpawnTab 'CurrentPaneDomain',
  },
  {
    mods = "LEADER|CTRL",
    key = 'a',
    action = act.ActivateLastTab,
  },
  {
    mods = "LEADER",
    key = ' ',
    action = act.ActivateTabRelative(1),
  },
  {
    mods = "LEADER|CTRL",
    key = ' ',
    action = act.ActivateTabRelative(-1),
  },
  {
    mods = "LEADER",
    key = '-',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    mods = "LEADER",
    key = '=',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = "h",
    mods = "CTRL|SHIFT",
    action = act.AdjustPaneSize { "Left", 5 },
  },
  {
    key = "l",
    mods = "CTRL|SHIFT",
    action = act.AdjustPaneSize { "Right", 5 },
  },
  {
    key = "j",
    mods = "CTRL|SHIFT",
    action = act.AdjustPaneSize { "Down", 5 },
  },
  {
    key = "k",
    mods = "CTRL|SHIFT",
    action = act.AdjustPaneSize { "Up", 5 },
  },
  {
    key = "m",
    mods = "LEADER",
    action = act.TogglePaneZoomState,
  },
}

local index_offset = config.tab_and_split_indices_are_zero_based and 0 or 1
for i = index_offset, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "LEADER",
    action = act.ActivateTab(i - index_offset)
  })
end

config.window_background_opacity = 0
config.win32_system_backdrop = "Tabbed"

return config
