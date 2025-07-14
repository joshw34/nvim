return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      enabled = true,
      auto_create = false,

      auto_restore = false,
      auto_restore_last_session = false,
      auto_save = false,
      cwd_change_handling = false,
      root_dir = vim.fn.expand("~/.config/nvimsessions/"),
      use_git_branch = true,
      session_lens = {
        load_on_setup = true,
      },
    })
  end,
}
