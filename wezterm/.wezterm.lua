local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Tokyo Night Moon'
config.font = wezterm.font('JetBrains Mono NL', { weight = 'Medium' })
config.tab_and_split_indices_are_zero_based = true

config.leader = { key = '\\', mods = 'CTRL', timeout_milliseconds = 2000 }
config.keys = {
  {
    key = '\\',
    mods = 'LEADER|CTRL',
    action = wezterm.action.SendKey { key = '\\', mods = 'CTRL' },
  },
  {
    key = 'v',
    mods = 'LEADER',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 's',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'h',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'j',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key = 'k',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'H',
    mods = 'LEADER',
    action = wezterm.action.AdjustPaneSize { 'Left', 5 },
  },
  {
    key = 'L',
    mods = 'LEADER',
    action = wezterm.action.AdjustPaneSize { 'Right', 5 },
  },
  {
    key = 'J',
    mods = 'LEADER',
    action = wezterm.action.AdjustPaneSize { 'Down', 5 },
  },
  {
    key = 'K',
    mods = 'LEADER',
    action = wezterm.action.AdjustPaneSize { 'Up', 5 },
  },
  {
    key = 'c',
    mods = 'LEADER',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = 'p',
    mods = 'LEADER',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = 'n',
    mods = 'LEADER',
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = '[',
    mods = 'LEADER',
    action = wezterm.action.ActivateCopyMode,
  },

  {
    key = '!',
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(11),
  },
  {
    key = '@',
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(12),
  },
  {
    key = '#',
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(13),
  },
  {
    key = '$',
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(14),
  },
  {
    key = '%',
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(15),
  },
  {
    key = '^',
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(16),
  },
  {
    key = '&',
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(17),
  },
  {
    key = '*',
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(18),
  },
  {
    key = '(',
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(19),
  },
  {
    key = ')',
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(20),
  },
}

for i = 0, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(i),
  })
end

return config
