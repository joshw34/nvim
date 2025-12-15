return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = '*',
      callback = function()
        local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
        if not lang then
          return
        end

        -- Check if already installed
        local installed = vim.tbl_contains(
          require('nvim-treesitter.info').installed_parsers(),
          lang
        )

        -- Check if parser is available for installation
        local available = vim.tbl_contains(
          require('nvim-treesitter.parsers').available_parsers(),
          lang
        )

        -- Only install if available and not installed
        if available and not installed then
          vim.cmd("TSInstall " .. lang)
        end

        -- Enable highlighting
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
