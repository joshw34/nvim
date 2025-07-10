return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      hijack_cursor = true,
      hijack_netrw = true,
      actions = {
        open_file = {
          quit_on_open = true,
        },
        remove_file = {
          close_window = true,
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
      },
      git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        show_on_open_dirs = true,
        timeout = 400,
      },
      renderer = {
        add_trailing = true,
        highlight_git = true,
        highlight_modified = "all",
        highlight_opened_files = "all",

        special_files = {
          "Makefile",
          "compile_commands.json",
          ".clangd",
          "en.subject.pdf",
        },

      },
      ui = {
        confirm = {
          remove = true,
        },
      },
    })
  end,
}
