return {
  {
    "cdmill/neomodern.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("neomodern").setup({
        theme = "gyokuro",
         code_style = {
          comments = "italic",
          conditionals = "none",
          functions = "italic",
          keywords = "none",
          headings = "bold", -- Markdown headings
          operators = "none",
          keyword_return = "bold",
          strings = "none",
          variables = "none",
        },
        highlights = {
          ["@lsp.mod.readonly"] = { fg = "", fmt = "none" },
          ["@keyword.exception"] = { fg = "#9e5560", fmt = "bold" },
        },
      })
      require("neomodern").load()
      vim.api.nvim_set_hl(0, "@lsp.mod.readonly", {})
    end,
  }
}
