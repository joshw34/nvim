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

-- Add $ to keyword characters for nginx files
autocmd("FileType", {
  desc = "Add $ to keywords in nginx files",
  pattern = "nginx",
  group = augroup("nginx-keywords", { clear = true }),
  callback = function()
    vim.opt_local.iskeyword:append("$")
  end,
})
