local signs = {
  Error = "󰅚 ",
  Warn  = "󰀪 ",
  Hint  = "󰌶 ",
  Info  = "󰋽 "
}

vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
    source = "always",
  --   severity = {           -- 仅显示警告以上的诊断
  --       min = vim.diagnostic.severity.WARN,
  --   },
  },
  float = {
    border = 'rounded',
    source = "always",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = signs.Error,
      [vim.diagnostic.severity.WARN]  = signs.Warn,
      [vim.diagnostic.severity.HINT]  = signs.Hint,
      [vim.diagnostic.severity.INFO]  = signs.Info,
    },
  },        -- 在侧边栏显示图标
  underline = true,    -- 保持下划线
  update_in_insert = false, -- 别在打字时烦我
  severity_sort = true,    -- 错误比警告更重要
})
