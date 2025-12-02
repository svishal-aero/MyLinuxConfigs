local wezterm = require 'wezterm'
local config  = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 28

config.font = wezterm.font('JetBrainsMonoNL Nerd Font')

config.font_size    = 13
config.color_scheme = 'Catppuccin Mocha'

config.window_decorations = 'NONE | RESIZE'
config.window_padding     = {left=0, right=0, top=0, bottom=0}
--config.use_fancy_tab_bar = false
--config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.85

wezterm.on('augment-command-palette',
  function(window, pane)
    return {
      {
        brief = 'Maximize window',
        action = wezterm.action_callback(function(w, p) w:maximize() end)
      },
      {
        brief = 'Restore window',
        action = wezterm.action_callback(function(w, p) w:restore() end)
      },
    }
  end
)

config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = wezterm.action.CompleteSelection 'Clipboard',
  },

  -- 2. Middle mouse button down: paste from PrimarySelection (or Clipboard)
  {
    event = { Down = { streak = 1, button = 'Middle' } },
    mods = 'NONE',
    action = wezterm.action.PasteFrom 'PrimarySelection',
  },
}

return config
