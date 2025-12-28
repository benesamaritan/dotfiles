return {
  {
    "ray-x/web-tools.nvim",
    dependencies = {
      "ray-x/guihua.lua",
    },
    config = function()
      require('web-tools').setup({
        keymaps = {
          rename = nil,
        },
      })
    end,
  }
}
