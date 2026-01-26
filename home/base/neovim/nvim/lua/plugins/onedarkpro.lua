return {
  'olimorris/onedarkpro.nvim',
  priority = 1000,  -- 确保先加载
  config = function()
    require('onedarkpro').setup({
      theme = 'onedark',  -- 或 'onedark_vivid'
    })
    vim.cmd.colorscheme('onedark')
  end
}
