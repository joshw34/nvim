return {
  -- Mason only used if no system package exists
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
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

      -- Nixd setup
      lspconfig.nixd.setup({
        cmd = { "nixd" },
        filetypes = { "nix" },
        root_dir = find_root({"flake.nix"}),
        capabilities = capabilities,
      })

      -- Pyright setup
      lspconfig.pyright.setup({
        cmd = {
          "pyright-langserver",
          "--stdio"
        };
        filetypes = { "python" },
        root_dir = find_root({ ".git" }),
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              useLibraryCodeForTypes = true
            },
          },
        },
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
