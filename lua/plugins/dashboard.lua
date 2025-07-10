return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
      theme = "doom",
      config = {
        header = {
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",

          "",
          "",
          "",
          "",
          "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
          "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
          "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
          "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
          "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
          "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
        },
        center = {
          {
            icon = " ",
            desc = "New File",
            key = "n",
            action = "enew",
          },
          {
            icon = " ",
            desc = "Find File",
            key = "f",
            action = "Telescope find_files",
          },
          {
            icon = " ",
            desc = "Recent Files",
            key = "r",
            action = "Telescope oldfiles",
          },
          {
            icon = " ",
            desc = "Live Grep",
            key = "g",
            action = "Telescope live_grep",
          },
          {
            icon = " ",
            desc = "Load Session",
            key = "s",
            action = "Telescope session-lens",
          },
        },
      },
    })
  end,
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
