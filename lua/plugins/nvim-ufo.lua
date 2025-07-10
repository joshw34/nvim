return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },

  config = function()
    require("ufo").setup({
      provider_selector = function(bufnr, filetype, buftype)
        -- Skip special buffer types
        if buftype ~= "" then
          return ""
        end
        
        -- Skip if no filetype
        if filetype == "" then
          return ""

        end
        
        -- Use appropriate providers for known filetypes
        local ftMap = {
          cpp = {'lsp', 'indent'},
          c = {'lsp', 'indent'},
          nix = {'lsp', 'indent'},
          hyprlang = {'lsp', 'indent'},

          lua = {'treesitter', 'indent'}
        }
        
        return ftMap[filetype] or {'indent'}
      end,
    })
  end,
}
