return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "lua_ls" },
        handlers = {
          -- Default handler for any server not explicitly configured
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = require("blink.cmp").get_lsp_capabilities(),
            })
          end,
          
          -- Custom clangd configuration
          ["clangd"] = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            capabilities.textDocument.semanticTokens = {
              multilineTokenSupport = true
            }
            
            lspconfig.clangd.setup({
              cmd = {
                "clangd",
                "--header-insertion=never",
                "--completion-style=detailed",
                "--function-arg-placeholders=false",
                "--suggest-missing-includes=false",
                "--background-index",
                "--pch-storage=memory"
              },
              filetypes = { "c", "cpp", "h", "hpp" },
              root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".clangd", ".git"),
              capabilities = capabilities,
            })
          end,
          
          -- Custom lua_ls configuration
          ["lua_ls"] = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            
            lspconfig.lua_ls.setup({
              root_dir = lspconfig.util.root_pattern(".git"),
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" },
                  },
                  workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                  },
                  telemetry = {
                    enable = false,
                  },
                },
              },
            })
          end,
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
  },
}
