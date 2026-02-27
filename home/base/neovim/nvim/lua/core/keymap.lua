vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = true })
vim.keymap.set("n", "<leader>q", ":q<CR>", { silent = true })
vim.keymap.set("n", "<leader>wq", ":wq<CR>", { silent = true })

vim.keymap.set('n', '<C-l>', 'gcc', { remap = true })
vim.keymap.set("n", "gd", require('telescope.builtin').lsp_definitions, {})


vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "显示浮窗错误信息" })

vim.keymap.set("n", "<leader>l", "<CMD>Lazy<CR>", { desc = "打开 Lazy 插件管理器" })
vim.keymap.set("n", "<leader>t", "<CMD>NvimTreeToggle<CR>", { desc = "打开侧边栏目录树" })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "打开 Oil 文件浏览器" })
vim.keymap.set("n", "<leader>o", function()
  require("oil").toggle_float()
end, { desc = "浮动窗口打开 Oil" })

-- 切换 ture 和 false
vim.keymap.set("n", "gs", function()
  -- 获取当前行内容、光标所在行号和列号
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2] -- 0-indexed

  -- True 和 False 互转
  local map = {
    ["true"] = "false",
    ["false"] = "true",
    ["True"] = "False",
    ["False"] = "True",
    ["TRUE"] = "FALSE",
    ["FALSE"] = "TRUE",
  }

  -- 获取光标下的单词及其起始/结束列号
  -- [1] 是单词内容, [2] 是起始列号, [3] 是结束列号
  local word_info = vim.fn.expand("<cword>")
  local cword_start = vim.fn.matchstrpos(line:sub(1, col + 1), [[\k*$]])[2]
  local cword_end = cword_start + #word_info

  -- 检查光标下的单词是否在我们的转换表里
  local new_word = map[word_info]

  if new_word then
    -- 仅替换光标所在位置的字符串，不影响行内其他部分
    local new_line = line:sub(1, cword_start) .. new_word .. line:sub(cword_end + 1)
    vim.api.nvim_set_current_line(new_line)
  else
    print("Cursor is not on a boolean value")
  end
end, { desc = "精确切换光标下的布尔值" })


-- 文件内全局替换
vim.keymap.set("n", "<leader>rp", function()
  -- 获取光标下的单词作为默认值
  local old_word = vim.fn.expand("<cword>")
  -- 弹出输入框获取新单词
  vim.ui.input({ prompt = '替换 "' .. old_word .. '" 为: ', default = "" }, function(new_word)
    if new_word and new_word ~= "" then
      -- 执行全局替换命令
      -- %s: 全局 / g: 全部匹配 / c: 确认（可选）
      vim.cmd(string.format("%%s/%s/%s/g", old_word, new_word))
      print(string.format("已将 %s 替换为 %s", old_word, new_word))
    end
  end)
end, { desc = "全局替换光标下的单词" })
