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
        automatic_setup = false,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      
      -- Use blink.cmp capabilities for better integration
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      capabilities.textDocument.semanticTokens = {
        multilineTokenSupport = true
      }
      
      -- Helper function to find root directory
      local function find_root(patterns)
        return lspconfig.util.root_pattern(unpack(patterns))
      end
      
      -- Clangd setup
      lspconfig.clangd.setup({
        cmd = {
          "clangd",
          "--header-insertion=never",
          "--completion-style=detailed",
          "--function-arg-placeholders=true",
          "--suggest-missing-includes=false",
          "--background-index",
          "--pch-storage=memory"
        },
        filetypes = { "c", "cpp", "h", "hpp" },
        root_dir = find_root({ "compile_commands.json", "compile_flags.txt", ".clangd", ".git" }),
        capabilities = capabilities,
      })
      
      -- Lua LSP setup
      lspconfig.lua_ls.setup({
        root_dir = find_root({ ".git" }),
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
}
