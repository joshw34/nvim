return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      direction = "float",
      float_opts = {
        border = "curved",
        height = function(term)
          return math.floor(vim.o.lines * 0.8)
        end,
        width = function(term)
          return math.floor(vim.o.columns * 0.9)
        end,
      },
      open_mapping = "<C-t>",
    })
  end,
}
