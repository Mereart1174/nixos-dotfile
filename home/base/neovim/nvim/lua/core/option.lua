local o = vim.opt

o.number = true
o.relativenumber = true

o.list = true
o.listchars = {
  space = "·", -- 空格显示为点
  tab = "»·", -- tab 显示
  trail = "·", -- 行尾多余空格
}

o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true

-- 高亮光标行
o.cursorline = true

-- 持久化撤销历史
o.undofile = true

o.whichwrap = "b,s,<,>,[,],h,l"
o.virtualedit = "onemore"

-- 光标移动上下文
o.scrolloff = 5
