local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<C-b>", ":!make<CR>", opts)
