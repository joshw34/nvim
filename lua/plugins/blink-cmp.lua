return {
  "saghen/blink.cmp",
  lazy = false,
  dependencies = "rafamadriz/friendly-snippets",
  version = "v0.*",
  config = function()
    require("blink.cmp").setup({
      appearance = {
        nerd_font_variant = "normal",
      },
      completion = {
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },
        documentation = {
          auto_show = true,
        },
      },
      keymap = {
        preset = "super-tab",
      },
      signature = {
        enabled = true,
      },
      sources = {
        default = { "lsp", "path", "buffer" },
      },
    })
  end,
}
