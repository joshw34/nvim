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
        if ft == "c" or ft == "cpp" or ft == "h" or ft == "hpp" or ft == "html" then
          require("conform").format({ lsp_fallback = true })
        end
      end,
      mode = { "n", "v" },
      desc = "Format files",
    },
  },
  opts = {
    formatters_by_ft = {
      c = { "clang_format" },
      cpp = { "clang_format" },
      h = { "clang_format" },
      hpp = { "clang_format" },
      html = { "prettier" },
    },
    formatters = {
      clang_format = {
        args = { "--style=file" },
      },
    },
  },
}
