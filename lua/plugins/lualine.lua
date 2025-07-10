return {
  "nvim-lualine/lualine.nvim",

  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        globalstatus = true,
        theme = "auto",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename" },
        lualine_x = { 
          "diagnostics",
          "encoding", 
          "fileformat", 
          "filetype" 
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
