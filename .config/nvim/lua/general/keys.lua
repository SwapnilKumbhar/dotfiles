local opts = { noremap = true, silent = true }
local nvim_keymap = vim.api.nvim_set_keymap
local set_keymap = vim.keymap.set

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Resizing
nvim_keymap("n", "<M-Down>", ":resize -2<CR>", opts)
nvim_keymap("n", "<M-Up>", ":resize +2<CR>", opts)
nvim_keymap("n", "<M-Right>", ":vertical resize -2<CR>", opts)
nvim_keymap("n", "<M-Left>", ":vertical resize +2<CR>", opts)

-- TAB for moving buffers, Ctrl+W closing files
nvim_keymap("n", "<TAB>", ":bnext<CR>", opts)
nvim_keymap("n", "<S-TAB>", ":bprevious<CR>", opts)
nvim_keymap("n", "<C-w>", ":bd<CR>", opts)

-- FZF files
nvim_keymap("n", "<C-p>", ":GFiles<CR>", opts)
nvim_keymap("n", "<S-p>", ":Files<CR>", opts)

-- Better Tabbing
nvim_keymap("v", "<", "<gv", opts)
nvim_keymap("v", ">", ">gv", opts)

-- For whem my ESC key breaks
nvim_keymap("i", "<C-c>", "<ESC>", opts)

-- Better window navigation
nvim_keymap("n", "<C-h>", "<C-w>h", opts)
nvim_keymap("n", "<C-j>", "<C-w>j", opts)
nvim_keymap("n", "<C-k>", "<C-w>k", opts)
nvim_keymap("n", "<C-l>", "<C-w>l", opts)

-- Save Better
nvim_keymap("i", "<C-s>", "<ESC>:w<CR>", opts)
nvim_keymap("n", "<C-s>", ":w<CR>", opts)

-- Telescope
local ts_builtins = require("telescope.builtin")
set_keymap("n", "gr", ts_builtins.lsp_references, { desc = "[G]et [R]eferences" })
set_keymap("n", "gd", ts_builtins.lsp_definitions, { desc = "[G]et [D]efinitions" })
set_keymap("n", "gi", ts_builtins.lsp_implementations, { desc = "[G]et [I]mplementations" })
set_keymap("n", "gD", ts_builtins.lsp_type_definitions, { desc = "Get Type Defns" })

-- LSP
set_keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover over variable" })
set_keymap("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
set_keymap("n", "<A-c>", vim.lsp.buf.code_action, { desc = "Code Actions" })
set_keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Jump to previous error/warning" })
set_keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Jump to next error/warning" })
set_keymap("n", "<A-r>", vim.lsp.buf.rename, { desc = "Rename symbol" })

-- Rg
nvim_keymap("n", "<C-f>", ":Rg<CR>", opts)
