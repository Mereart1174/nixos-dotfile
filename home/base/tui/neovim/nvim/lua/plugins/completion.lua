return {
  "saghen/blink.cmp",
  dependencies = "rafamadriz/friendly-snippets",
  version = "v0.*", -- 使用最新稳定版

  opts = {
    -- 快捷键设置：推荐使用 'super-tab' 模式，符合 VSCode 习惯
    keymap = { preset = "default" },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },

    -- 定义补全来源
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    -- 开启实验性签名帮助（对 C/Rust 函数参数非常有帮助）
    signature = { enabled = true },
  },
}
