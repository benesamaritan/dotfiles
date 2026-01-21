local wezterm = require "wezterm"

local colors = wezterm.color.load_scheme(wezterm.config_dir .. "/colors/dank-theme.toml")
wezterm.add_to_config_reload_watch_list(wezterm.config_dir .. "/colors/dank-theme.toml")
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

local config = {
  -- initial_cols = 120,
  -- initial_rows = 28,
  font_size = 13,
  font = wezterm.font "JetBrains Mono",
  -- color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
  color_scheme = "dank-theme",
  colors = {
    tab_bar = {
      background = colors.ansi[1] or "transparent",
    },
  },
  window_padding = {
    left = 12,
    right = 12,
    top = 12,
    bottom = 2,
  },
  window_background_opacity = 0.85,
  -- text_background_opacity = 0.5,
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  tab_bar_at_bottom = true,
  show_new_tab_button_in_tab_bar = false,
  tab_max_width = 25,
  inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.8,
  },
}

tabline.setup({
  options = {
    theme = colors,
    theme_overrides = {
      normal_mode = {
        a = { fg = colors.ansi[5], bg = colors.ansi[1] },
        x = { fg = colors.ansi[5], bg = colors.ansi[9] },
        y = { fg = colors.ansi[1], bg = colors.ansi[6] },
      },
      -- copy_mode = {
      --   a = { fg = colors.ansi[4], bg = colors.ansi[1] },
      --   x = { fg = colors.ansi[4], bg = colors.ansi[1] },
      --   y = { fg = colors.ansi[1], bg = colors.ansi[8] },
      -- },
      -- search_mode = {
      --   a = { fg = colors.ansi[4], bg = colors.ansi[1] },
      --   x = { fg = colors.ansi[4], bg = colors.ansi[1] },
      --   y = { fg = colors.ansi[1], bg = colors.ansi[8] },
      -- },
      -- window_mode = {
      --   a = { fg = colors.background, bg = colors.ansi[7] },
      --   b = { fg = colors.ansi[5], bg = colors.background },
      -- },
      tab = {
        active = { fg = colors.ansi[1], bg = colors.ansi[5]},
        inactive = { fg = colors.ansi[5], bg = colors.ansi[1]},
        inactive_hover = { fg = colors.ansi[5], bg = colors.ansi[1] },
      }
    },
    section_separators = {
      left = wezterm.nerdfonts.ple_right_half_circle_thick,
      right = wezterm.nerdfonts.ple_left_half_circle_thick,
    },
    component_separators = {
      left = wezterm.nerdfonts.ple_right_half_circle_thin,
      right = wezterm.nerdfonts.ple_left_half_circle_thin,
    },
    tab_separators = {
      left = wezterm.nerdfonts.ple_right_half_circle_thick,
      right = wezterm.nerdfonts.ple_left_half_circle_thick,
    },
  },
  sections = {
    tabline_b = {''},
    tab_active = {
      {
        'parent',
        max_length = 4,
        padding = 0
      },
      '/',
      {
        'cwd',
        padding = { left = 0, right = 1 },
        max_length = 6,
      },
      {
        'zoomed',
        padding = 0
      },
    },
    tabline_y = {
      'datetime',
      {
        'battery',
        icons_only = true,
      }
    },
    tabline_z = {{''}},
  },
})

wezterm.on("window-config-reloaded", function(window, pane)
  tabline.set_theme(colors)
  tabline.refresh(window)
end)

return config
