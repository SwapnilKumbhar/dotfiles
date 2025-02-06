local packer = require("packer")

packer.startup(function(use)
  -- packer
  use("wbthomason/packer.nvim")

  -- Autopairs
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })

  -- Alduin theme
  use({
    "AlessandroYorba/Alduin",
    config = function()
      vim.g.alduin_Shout_Dragon_Aspect = 1
    end,
  })

  -- Lualine
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  use({ "nvim-web-devicons" })

  -- Bufferline
  use({
    "akinsho/bufferline.nvim",
    tag = "v3.*",
    requires = "nvim-tree/nvim-web-devicons",
  })

  -- FZF
  use({ "junegunn/fzf", run = ":call fzf#install()" })
  use({ "junegunn/fzf.vim" })

  -- Whichkey
  use({ "folke/which-key.nvim" })

  -- VimTex
  use({ "lervag/vimtex" })

  -- GitSigns
  use({ "lewis6991/gitsigns.nvim" })

  -- Fugitive <3
  use({ "tpope/vim-fugitive" })

  -- Move
  use({ "fedepujol/move.nvim" })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })

  -- LSP config
  use("neovim/nvim-lspconfig")

  -- LSP
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-buffer" })
  use({ "hrsh7th/cmp-path" })
  use({ "hrsh7th/cmp-cmdline" })
  use({ "hrsh7th/nvim-cmp" })

  use({ "williamboman/mason.nvim" })
  use({ "williamboman/mason-lspconfig.nvim" })

  -- Snippets
  use({ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" })
  use({ "rafamadriz/friendly-snippets" })

  -- Telescope
  use({ "nvim-telescope/telescope-file-browser.nvim" })
  use({ "nvim-lua/plenary.nvim" })
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    requires = { { "nvim-lua/plenary.nvim" } },
  })

  -- Starter (not using Startify anymore)
  use({ "echasnovski/mini.starter", branch = "stable" })

  -- Session Management
  use({ "echasnovski/mini.sessions", branch = "stable" })

  -- null-ls
  use({ "jose-elias-alvarez/null-ls.nvim" })

  -- Glow 🌟
  use({ "ellisonleao/glow.nvim" })

  -- DAP
  use 'mfussenegger/nvim-dap'

  -- DAP UI
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

  -- LSP for Vim functions
  use "folke/neodev.nvim"
end)

-- Load all setups
require("cfgs")
