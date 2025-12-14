return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = {
        "bash",
        "zsh",
        "c",
        "cpp",
        "lua",
        "python",
        "dockerfile",
        "nginx",
        "go",
        "html",
        "vim",
        "vimdoc",
        "query",
        "nix",
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
