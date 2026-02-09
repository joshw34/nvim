-- ~/.config/nvim/lua/plugins/conform.lua
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>a",
      function()
        local ft = vim.bo.filetype
        if ft == "c" or ft == "cpp" or ft == "h" or ft == "hpp" or ft == "html" 
          or ft == "javascript" or ft == "javascriptreact" 
          or ft == "typescript" or ft == "typescriptreact"
          or ft == "css" or ft == "scss" or ft == "less"
          or ft == "json" or ft == "jsonc" or ft == "go"
          or ft == "gomod" or ft == "gosum" or ft == "gotmpl" then
          require("conform").format({ lsp_fallback = true })
        end
      end,
      mode = { "n", "v" },
      desc = "Format files",
    },
  },
  opts = {
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    formatters_by_ft = {
      c = { "clang_format" },
      cpp = { "clang_format" },
      h = { "clang_format" },
      hpp = { "clang_format" },
      html = { "prettier" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      less = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      go = { "gofumpt" },
      gomod = { "gofumpt" },
      gosum = { " gofumpt" },
      gotmpl = { "gofumpt" },
    },
    formatters = {
      clang_format = {
        args = { "--style=file", "--fallback-style=Google" },
      },
    },
  },
}
