-- 创建缩进配置表
local indent_configs = {
  -- 2 空格的语言
  nix = 2,
  javascript = 2,
  javascriptreact = 2,
  typescript = 2,
  typescriptreact = 2,
  json = 2,
  yaml = 2,
  yml = 2,
  markdown = 2,
  toml = 2,
  lua = 2,
  vim = 2,
  -- 4 空格的语言
  python = 4,
  lua = 4,
  go = 4,
  c = 4,
  cpp = 4,
  java = 4,
  rust = 4,
  -- 特殊语言
  make = 8,  -- Makefile 用 Tab
}

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    local indent = indent_configs[ft] or 4  -- 默认 4
    
    vim.opt_local.tabstop = indent
    vim.opt_local.shiftwidth = indent
    vim.opt_local.softtabstop = indent
    vim.opt_local.expandtab = ft ~= 'make'  -- Makefile 不用空格
  end
})

vim.api.nvim_create_autocmd({'ColorScheme'}, {
  callback = function()
    vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#1e222a' })
  end
})
