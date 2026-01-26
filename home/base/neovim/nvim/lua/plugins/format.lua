return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          "bash",
          "c",
          "cmake",
          "dockerfile",
          "html",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "rust",
          "sql",
          "vim",
          "vimdoc",
        },
        highlight = { enable = true },
      })
    end,
  },

  -- 第二个插件：显示屏幕外的括号/函数头上下文
  {
    "nvim-treesitter/nvim-treesitter-context",
    -- 确保在 treesitter 加载后再加载
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      enable = true, -- 启用此插件
      max_lines = 3, -- 顶部最多显示的行数（避免占用过多空间）
      min_window_height = 0, -- 窗口高度小于此值时不显示
      line_numbers = true, -- 在上下文栏显示行号
      multiline_threshold = 20, -- 多行文本显示的最大行数
      trim_scope = "outer", -- 当超出 max_lines 时，优先去掉外层范围
      mode = "cursor", -- 计算上下文的模式（'cursor' 或 'topline'）
    },
    config = function(_, opts)
      require("treesitter-context").setup(opts)

      -- 额外提示：设置一个背景色，让“置顶显示”的行与普通代码有明显的视觉区分
      -- 颜色可以根据你的主题调整
      vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#42465c" })
    end,
  },

  -- 保存后自动格式化
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" }, -- 在保存前触发加载，优化启动速度
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        rust = { "rustfmt" },
        cpp = { "clang-format" },
        python = { "isort", "black" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        bash = { "shfmt" },
        nix = { "nixfmt" },
      },
    },
  },
}
