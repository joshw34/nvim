return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  config = function()
    require("lsp_lines").setup()
    
    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = false,
      float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
        format = function(diagnostic)
          return string.format("%s (%s)", diagnostic.message, diagnostic.source)
        end,
      },
    })
    
    -- Show diagnostics in floating window on cursor hold
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        vim.diagnostic.open_float(nil, {
          focusable = false,
          close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
          border = "rounded",
          source = "always",
          prefix = " ",
          scope = "cursor",
        })
      end
    })
    
    -- manually show diagnostics
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
    
    -- updatetime for CursorHold event
    vim.opt.updatetime = 200
  end,
}
