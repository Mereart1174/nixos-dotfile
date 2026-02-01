return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },

  config = function()
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    vim.lsp.config("clangd", {
      capabilities = capabilities,
      cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--header-insertion=iwyu",
      "--completion-style=detailed",
      "--pch-storage=memory",
      }
    })
    vim.lsp.config("rust_analyzer", { capabilities = capabilities })
    vim.lsp.config("pyright", { capabilities = capabilities })
    vim.lsp.config("bashls", { capabilities = capabilities })
    vim.lsp.config("marksman", { capabilities = capabilities })
    vim.lsp.config("ts_ls", { capabilities = capabilities })
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
        }
      }
    })
    vim.lsp.config("nil", {
      capabilities = capabilities,
      settings = {
        ["nil"] = {
          formatting = { command = { "nixfmt" } },
          nix = {
            maxMemoryMB = 256,
              flake = { autoArchive = true },
          },
        },
      },
    })
    local servers = {
      "clangd",
      "rust_analyzer",
      "pyright",
      "lua_ls",
      "ts_ls",
      "bashls",
      "marksman",
      "nil",
    }
    
    for _, server in ipairs(servers) do
      vim.lsp.enable(server)
    end
  end,
}
