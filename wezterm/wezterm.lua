local wezterm = require "wezterm"

wezterm.add_to_config_reload_watch_list(wezterm.config_dir .. "/colors/dank-theme.toml")

-- wezterm.on('update-right-status', function(window, pane)
--   window:set_left_status 'left'
--   window:set_right_status 'right'
-- end)

local config = {
  -- initial_cols = 120,
  -- initial_rows = 28,
  font_size = 15,
  font = wezterm.font "JetBrains Mono",
  -- color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
  color_scheme = "dank-theme",
  window_padding = {
    left = 10,
    right = 10,
    top = 14,
    bottom = 14,
  },
  window_background_opacity = 0.7,
  -- text_background_opacity = 0.5,
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = false,
  tab_bar_at_bottom = true,
  show_new_tab_button_in_tab_bar = false,
  tab_max_width = 25,
  inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.8,
  },
}

local colors = wezterm.color.load_scheme(wezterm.config_dir .. "/colors/dank-theme.toml")

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
 options = {
    theme = colors,
    -- theme_overrides = {
    --   normal_mode = {
    --     a = { fg = colors.foreground, bg = colors.ansi[2] },
    --     b = { fg = colors.ansi[2], bg = colors.background },
    --     c = { fg = colors.foreground, bg = colors.background },
    --   },
    --   copy_mode = {
    --     a = { fg = colors.background, bg = colors.ansi[3] },
    --     b = { fg = colors.ansi[3], bg = colors.background },
    --     c = { fg = colors.foreground, bg = colors.background },
    --   },
    --   search_mode = {
    --     a = { fg = colors.background, bg = colors.ansi[4] },
    --     b = { fg = colors.ansi[4], bg = colors.background },
    --     c = { fg = colors.foreground, bg = colors.background },
    --   },
    --   window_mode = {
    --     a = { fg = colors.background, bg = colors.ansi[5] },
    --     b = { fg = colors.ansi[5], bg = colors.background },
    --     c = { fg = colors.foreground, bg = colors.background },
    --   },
    --   tab = {
    --     active = { fg = colors.ansi[7], bg = colors.background },
    --     inactive = { fg = colors.foreground, bg = colors.background },
    --     inactive_hover = { fg = colors.brights[7], bg = colors.background },
    --   }
    -- },
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
    tabline_b = {
      {
        'workspace',
        icons_only = true,
      }
    },
    tab_active = {
      {
        'index',
        zero_indexed = true,
      },
      { 'parent', padding = 0 },
      '/',
      {
        'cwd',
        padding = { left = 0, right = 1 },
        max_length = 8,
      },
      { 'zoomed', padding = 0 },
    },
    tabline_z = {
      {
        'domain',
        icons_only = true,
      }
    },
  },
})
tabline.set_theme(colors)

wezterm.on("window-config-reloaded", function(window, pane)
  tabline.set_theme(colors)
  tabline.refresh(window)
end)

return config
