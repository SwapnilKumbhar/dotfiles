-- Lualine
require("lualine").setup({
  options = {
    theme = require("lualine.themes.gruvbox-material"),
  },
  sections = {
    lualine_a = {
      "tabs",
    },
  },
})

-- Bufferline
vim.opt.termguicolors = true
require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp",
    indicator = {
      icon = "|",
      style = "icon",
    },
    separator_style = "slant",
    diagnostics_indicator = function(count, level, _, _)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    color_icons = true,
    show_buffer_icons = true,
    show_buffer_default_icon = true,
    show_close_icon = true,
    show_tab_indicators = true,
  },
})

-- nvim rooter. Let's give this a shot.
require("nvim-rooter").setup({
  rooter_patterns = {
    ".git",
    ".svn",
    ".hg",
    "node_modules",
    "venv",
    "cargo.toml",
  },
})

-- Whichkey
local whichMap = {
  f = { ":Telescope file_browser path=%:p:h<CR>", "Search Files" },
  v = { ":vsplit<CR>", "Split Verically" },
  S = { ":Startify<CR>", "Startify" },
  t = { ":Tags<CR>", "Search/Generate Tags" },
  s = {
    name = "+Search",
    c = { ":Commits<CR>", "Commits" },
    h = { ":History<CR>", "History" },
    H = { ":HelpTags<CR>", "Help Tags" },
    s = { ":Ag<CR>", "Text Search" },
    f = { ":Filetypes<CR>", "File Types" },
    C = { ":Colors<CR>", "Color Themes" },
  },
  g = {
    name = "+Git",
    g = { ":G<CR>", "Git status" },
    b = { ":G blame<CR>", "Git blame" },
    l = { ":G log<CR>", "Git log" },
    d = { ":G diff<CR>", "Git diff" },
  },
}
local wk = require("which-key")
wk.setup()
wk.register({
  ["<leader>"] = whichMap,
})

-- FZF
vim.g.fzf_layout = {
  up = "~90%",
  window = {
    width = 0.8,
    height = 0.8,
    yoffset = 0.5,
    xoffset = 0.5,
    highlight = "Todo",
    border = "sharp",
    reverse = true,
  },
}

-- VimTex
-- We use `mupdf`
vim.g.vimtex_view_method = "mupdf"
vim.g.vimtex_view_general_viewer = "mupdf"
vim.g.vimtex_view_general_options = "-I "
vim.g.vimtex_compiler_method = "latexmk"

-- GitSigns
require("gitsigns").setup()

-- Move
local move_opts = { noremap = true, silent = true }
-- Normal Mode
vim.keymap.set("n", "<A-j>", ":MoveLine(1)<CR>", move_opts)
vim.keymap.set("n", "<A-k>", ":MoveLine(-1)<CR>", move_opts)
vim.keymap.set("n", "<A-h>", ":MoveHChar(-1)<CR>", move_opts)
vim.keymap.set("n", "<A-l>", ":MoveHChar(1)<CR>", move_opts)

-- Visual-mode commands
vim.keymap.set("v", "<A-j>", ":MoveBlock(1)<CR>", move_opts)
vim.keymap.set("v", "<A-k>", ":MoveBlock(-1)<CR>", move_opts)
vim.keymap.set("v", "<A-h>", ":MoveHBlock(-1)<CR>", move_opts)
vim.keymap.set("v", "<A-l>", ":MoveHBlock(1)<CR>", move_opts)

-- TreeSitter
require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  highlight = {
    enable = true, -- false will disable the whole extension
    -- disable = { "c", "rust", "python" },  -- list of language that will be disabled
  },
  indent = {
    enable = false,
  },
})

-- Telescope
require("telescope").load_extension("file_browser")

-- Session management
require("mini.sessions").setup({
  file = ".sess.vim",
  directory = "",
})

-- Glow
require("glow").setup({
  style = "dark",
  width = 200,
})

-- Noice
require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true,       -- use a classic bottom cmdline for search
    command_palette = true,     -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false,         -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false,     -- add a border to hover docs and signature help
  },
})

-- Cfgs in other files (The only ones that have complicated configs get their own file)
require("cfgs.cmp")
require("cfgs.mason")
require("cfgs.mini_starter")
require("cfgs.conform")
