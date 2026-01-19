local wezterm = require "wezterm"
local config = wezterm.config_builder()

function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return "Catppuccin Mocha"
  else
    return "Catppuccin Latte"
  end
end

local config = {
  initial_cols = 120,
  initial_rows = 28,
  font_size = 12,
  font = wezterm.font "JetBrains Mono",
  color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
  -- enable_tab_bar = false,
  window_padding = {
    left = 10,
    right = 10,
    top = 14,
    bottom = 14,
  },
  window_background_opacity = 0.7,
  -- text_background_opacity = 0.5,
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  tab_bar_at_bottom = true,
  inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.8,
  },
}

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup()
-- ({
  -- options = {
  --   theme_overrides = {
  --     normal_mode = {
  --       a = { fg = '#181825', bg = '#f5c2e7' },
  --       b = { fg = '#f5c2e7', bg = '#313244' },
  --       c = { fg = '#cdd6f4', bg = '#181825' },
  --     },
  --     copy_mode = {
  --       a = { fg = '#181825', bg = '#f9e2af' },
  --       b = { fg = '#f9e2af', bg = '#313244' },
  --       c = { fg = '#cdd6f4', bg = '#181825' },
  --     },
  --     search_mode = {
  --       a = { fg = '#181825', bg = '#a6e3a1' },
  --       b = { fg = '#a6e3a1', bg = '#313244' },
  --       c = { fg = '#cdd6f4', bg = '#181825' },
  --     },
  --     window_mode = {
  --       a = { fg = '#181825', bg = '#cba6f7' },
  --       b = { fg = '#cba6f7', bg = '#313244' },
  --       c = { fg = '#cdd6f4', bg = '#181825' },
  --     },
  --     tab = {
  --       active = { fg = '#f5c2e7', bg = '#313244' },
  --       inactive = { fg = '#cdd6f4', bg = '#181825' },
  --       inactive_hover = { fg = '#f5c2e7', bg = '#313244' },
  --     }
  --   },
  --   -- section_separators = {
    --   left = wezterm.nerdfonts.ple_right_half_circle_thick,
    --   right = wezterm.nerdfonts.ple_left_half_circle_thick,
    -- },
    -- component_separators = {
    --   left = wezterm.nerdfonts.ple_right_half_circle_thin,
    --   right = wezterm.nerdfonts.ple_left_half_circle_thin,
    -- },
    -- tab_separators = {
    --   left = wezterm.nerdfonts.ple_right_half_circle_thick,
    --   right = wezterm.nerdfonts.ple_left_half_circle_thick,
    -- }
    -- sections = {
    --   tabline_b = { 'window' }
    -- },
  -- }
-- })
-- tabline.apply_to_config(config)

return config
