return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({})
    
    local builtin = require("telescope.builtin")
    
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files in current directory" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep files in current directory" })

    vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "Grep string under cursor in current directory" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Show open buffers" })
    vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "List current keymaps" })
    vim.keymap.set("n", "<leader>fc", builtin.current_buffer_fuzzy_find, { desc = "Fuzzy find in current buffer" })
    vim.keymap.set("n", "<leader>fe", builtin.diagnostics, { desc = "Show lsp diagnostics (errors)" })
    vim.keymap.set("n", "<leader>fi", builtin.lsp_implementations, { desc = "Show lsp implementations" })
    vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { desc = "Show lsp definitions" })
    vim.keymap.set("n", "<leader>ft", builtin.lsp_type_definitions, { desc = "Show lsp type definitions" })
    vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Show lsp references" })
  end,
}
