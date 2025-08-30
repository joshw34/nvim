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
      --require("neomodern").load()
      vim.api.nvim_set_hl(0, "@lsp.mod.readonly", {})
    end,
  },
  {
    "AstroNvim/astrotheme",
    lazy = false,
    priority = 1000,
    config = function ()
      require("astrotheme").setup({
        palette = "astrodark", -- String of the default palette to use when calling `:colorscheme astrotheme`
        background = { -- :h background, palettes to use when using the core vim background colors
          light = "astrolight",
          dark = "astrodark",
        },

        style = {
          transparent = false,         -- Bool value, toggles transparency.
          inactive = true,             -- Bool value, toggles inactive window color.
          float = true,                -- Bool value, toggles floating windows background colors.
          neotree = true,              -- Bool value, toggles neo-trees background color.
          border = true,               -- Bool value, toggles borders.
          title_invert = true,         -- Bool value, swaps text and background colors.
          italic_comments = true,      -- Bool value, toggles italic comments.
          simple_syntax_colors = true, -- Bool value, simplifies the amounts of colors used for syntax highlighting.
        },


        termguicolors = true, -- Bool value, toggles if termguicolors are set by AstroTheme.

        terminal_color = true, -- Bool value, toggles if terminal_colors are set by AstroTheme.

        plugin_default = "auto", -- Sets how all plugins will be loaded
                           -- "auto": Uses lazy / packer enabled plugins to load highlights.
                           -- true: Enables all plugins highlights.
                           -- false: Disables all plugins.
      })
    end
  },
  { "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function ()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false, -- disables setting the background color.
        float = {
          transparent = false, -- enable transparent floating windows
          solid = false, -- use solid styling for floating windows, see |winborder|
        },
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = true, -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" }, -- Change the style of comments
          conditionals = {},
          loops = {},
          functions = { "italic" },
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
          -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        color_overrides = {},
        custom_highlights = {},
        default_integrations = true,
        auto_integrations = true,
      })
    vim.api.nvim_set_hl(0, "@module.cpp", {})
    vim.cmd.colorscheme "catppuccin"
    end,
  }
}
