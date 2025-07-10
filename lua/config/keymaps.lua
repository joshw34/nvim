-- Set keymaps
local keymap = vim.keymap.set

-- ToggleTerm keymaps
keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle float terminal" })
keymap("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal size=25<cr>", { desc = "Toggle horizontal terminal" })
keymap("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical size=75<cr>", { desc = "Toggle vertical terminal" })

-- NvimTree keymap
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle File Tree" })

-- LazyGit keymap
keymap("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Show LazyGit Terminal" })

-- Session keymaps
keymap("n", "<leader>ss", ":SessionSave ", { desc = "Save Session" })
keymap("n", "<leader>sl", ":Telescope session-lens<cr>", { desc = "Load Session" })
keymap("n", "<leader>sd", "<cmd>Autosession delete<cr>", { desc = "Delete Session" })

-- BufferLine keymaps
keymap("n", ",b", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer left" })
keymap("n", ".b", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer right" })

-- Window split keymaps
keymap("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Split window vertically" })
keymap("n", "<leader>sh", "<cmd>split<cr>", { desc = "Split window horizontally" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap("n", "<leader>sx", "<cmd>close<cr>", { desc = "Close current split" })

-- Buffer keymap
keymap("n", "<leader>c", "<cmd>bp|bd #<cr>", { desc = "Delete buffer keep window" })

-- Window navigation keymaps
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Window resize keymaps
keymap("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
