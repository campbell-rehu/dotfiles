local helpers = require("campbellrehu.core.helpers")
vim.g.mapleader = " "

helpers.generateKeymap("n", "<leader>nh", ":nohl<CR>", "Clear search highlights")

-- window management
helpers.generateKeymap("n", "<leader>sv", "<C-w>v", "Split window vertically")
helpers.generateKeymap("n", "<leader>sh", "<C-w>s", "Split window horizontally")
helpers.generateKeymap("n", "<leader>se", "<C-w>=", "Make splits equal size")

-- tab management
helpers.generateKeymap("n", "<leader>to", "<cmd>tabnew<CR>", "Open new tab")
helpers.generateKeymap("n", "<leader>tn", "<cmd>tabn<CR>", "Go to next tab")
helpers.generateKeymap("n", "<leader>tp", "<cmd>tabp<CR>", "Go to previous tab")
helpers.generateKeymap("n", "<leader>tx", "<cmd>tabclose<CR>", "Close current tab")
helpers.generateKeymap("n", "<leader>tf", "<cmd>tabnew %<CR>", "Open current buffer in new tab")

-- buffer management
helpers.generateKeymap("n", "<leader>bn", "<cmd>bn<CR>", "Go to next buffer")
helpers.generateKeymap("n", "<leader>bp", "<cmd>bp<CR>", "Go to previous buffer")
helpers.generateKeymap("n", "<leader>x", "<cmd>bd<CR>", "Close current buffer")
