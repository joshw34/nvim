local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight yanked text
autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 200,
    })
  end,
})

--set tabs = 2 spaces for lua/nix
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"nix", "lua"},
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})
