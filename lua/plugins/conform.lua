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
        if ft == "c" or ft == "cpp" or ft == "h" or ft == "hpp" then
          require("conform").format({ lsp_fallback = true })
        end
      end,
      mode = { "n", "v" },
      desc = "Format C/C++ files",
    },
  },
  opts = {
    formatters_by_ft = {
      c = { "clang_format" },
      cpp = { "clang_format" },
      h = { "clang_format" },
      hpp = { "clang_format" },
    },
    formatters = {
      clang_format = {
        args = { "--style=file" },
      },
    },
  },
}
