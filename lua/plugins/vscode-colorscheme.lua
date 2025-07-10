return {
  "Mofiqul/vscode.nvim",
  priority = 1000, -- Load colorscheme early
  config = function()
    require("vscode").setup({
      style = "dark", -- Enable dark variant
      italic_comments = true,
      disable_nvimtree_bg = true,
      terminal_colors = true,
    })
    
    -- Set the colorscheme
    vim.cmd("colorscheme vscode")
  end,
}
