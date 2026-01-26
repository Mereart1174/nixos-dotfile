return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- DAP UI 配置
      dapui.setup()
      dap.listeners.before.attach.dapui_config = function() dapui.open() end
      dap.listeners.before.launch.dapui_config = function() dapui.open() end
      dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
      dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

      -- 1. C/C++/Rust (使用 lldb-dap)
      -- 确保系统安装了 lldb
      -- 注意：新版 LLVM 将 lldb-vscode 重命名为 lldb-dap
      dap.adapters.lldb = {
        type = 'executable',
        -- 如果你的系统只有 lldb-vscode，请修改此处
        command = '/usr/bin/lldb-dap', 
        name = 'lldb'
      }

      -- C/Rust 调试：通常使用 gdb 或 lldb
      dap.configurations.c = {
        {
          name = "Launch file",
          type = "lldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopAtEntry = true,
        },
      }
      dap.configurations.rust = dap.configurations.c

      -- 自定义断点图标 (美化)
      vim.fn.sign_define(
        "DapBreakpoint",
        { text = "🛑", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
      )

      -- 快捷键设置
      vim.keymap.set("n", "<F5>", function()
        dap.continue()
      end, { desc = "开始/继续调试" })
      vim.keymap.set("n", "<F10>", function()
	        dap.step_over()
      end, { desc = "单步跳过" })
      vim.keymap.set("n", "<F11>", function()
        dap.step_into()
      end, { desc = "步入函数" })
      vim.keymap.set("n", "<F12>", function()
        dap.step_out()
      end, { desc = "步出函数" })
      vim.keymap.set("n", "<Leader>b", function()
        dap.toggle_breakpoint()
      end, { desc = "打断点" })
      vim.keymap.set("n", "<Leader>B", function()
        dap.set_breakpoint()
      end, { desc = "设置条件断点" })
      vim.keymap.set("n", "<Leader>dr", function()
        dap.repl.open()
      end, { desc = "打开 REPL" })
    end,
  },
}
