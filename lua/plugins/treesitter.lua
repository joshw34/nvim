return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local ts = require('nvim-treesitter')
    ts.setup {
      install_dir = vim.fn.stdpath('data') .. '/site'
    }
    -- Install parsers upfront
    ts.install({
      'bash',
      'c',
      'cpp',
      'css',
      'dockerfile',
      'go',
      'html',
      'javascript',
      'json',
      'lua',
      'nginx',
      'nix',
      'python',
      'typescript',
      'vim',
      'vimdoc',
    })

    -- Auto-enable highlighting
    vim.api.nvim_create_autocmd('FileType', {
      pattern = '*',
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
