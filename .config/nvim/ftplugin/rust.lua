local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<C-b>", ":!cargo build<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-b>", ":!cargo build --release<CR>", opts)
