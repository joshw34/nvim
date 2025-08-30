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
        filetypes = { "c", "cpp", "h", "hpp", "tpp" },
        root_dir = find_root({ "compile_commands.json", "compile_flags.txt", ".clangd", ".git" }),
        capabilities = capabilities,
      })

      -- gopls setup
      lspconfig.gopls.setup({
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gosum", "gotmpl" },
        root_dir = find_root({"go.mod", ".git", "go.work"}),
        capabilities = capabilities,
        settings = {
          gopls = {
            gofumpt = true,              -- Use gofumpt for formatting
            codelenses = {
              gc_details = false,
              generate = true,
              regenerate_cgo = true,
              run_govulncheck = true,
              test = true,
              tidy = true,
              upgrade_dependency = true,
              vendor = true,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            analyses = {
              nilness = true,
              unusedparams = true,
              unusedwrite = true,
              useany = true,
            },
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
            semanticTokens = true,
          },
        },
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
