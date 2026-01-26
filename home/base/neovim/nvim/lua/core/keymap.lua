vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = true })
vim.keymap.set("n", "<leader>q", ":q<CR>", { silent = true })
vim.keymap.set("n", "<leader>wq", ":wq<CR>", { silent = true })

vim.keymap.set("n", "<leader>l", "<CMD>Lazy<CR>", { desc = "打开 Lazy 插件管理器" })
vim.keymap.set("n", "<leader>e", "<CMD>NvimTreeToggle<CR>", { desc = "打开侧边栏目录树" })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "打开 Oil 文件浏览器" })
vim.keymap.set("n", "<leader>o", function()
  require("oil").toggle_float()
end, { desc = "浮动窗口打开 Oil" })

-- 切换 ture 和 false
vim.keymap.set("n", "gs", function()
  -- 获取当前行内容、光标所在行号和列号
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2] -- 0-indexed

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", require('telescope.builtin').lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    
    -- 开启 0.10+ 原生内联提示 (对 C 语言查看宏展开和 Rust 类型推断极有帮助)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})

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
