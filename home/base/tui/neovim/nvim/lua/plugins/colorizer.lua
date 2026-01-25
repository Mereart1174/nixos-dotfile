return {
  'NvChad/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup({
      filetypes = { '*' },  -- 所有文件类型
      user_default_options = {
        names = false,    -- "red" 颜色名
        RGB = true,      -- #RGB 格式
        RRGGBB = true,   -- #RRGGBB 格式
        RRGGBBAA = true, -- #RRGGBBAA 带透明度
        rgb_fn = true,   -- CSS rgb() 和 rgba()
        hsl_fn = true,   -- CSS hsl() 和 hsla()
        css = true,      -- CSS 所有格式
        css_fn = true,   -- CSS 函数格式
        mode = 'background', -- 显示模式
      }
    })
  end
}
