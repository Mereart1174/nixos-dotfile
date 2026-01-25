return {
  {
    "nvim-tree/nvim-tree.lua",
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    dependencies = { "nvim-mini/mini.icons" },
    opts = {
      -- 禁用 netrw (Vim自带文件浏览器)，为 Oil 让路
      disable_netrw = true,
      view = {
        width = 30,
        side = "left",
      },
      renderer = {
        group_empty = true,
        highlight_git = true,
      },
    },
  },

  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
  },
}
