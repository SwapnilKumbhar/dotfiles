-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

local spec = {
	---------- LSP
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp" },

	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	{ "neovim/nvim-lspconfig" },

	-- DAP
	{ "mfussenegger/nvim-dap" },

	---------- Graphics

	-- Alduin theme
	{
		"AlessandroYorba/Alduin",
		config = function()
			vim.g.alduin_Shout_Dragon_Aspect = 1
		end,
	},

	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	{ "nvim-web-devicons" },

	-- Starter (not using Startify anymore)
	{ "echasnovski/mini.starter", branch = "stable" },

	-- Session Management
	{ "echasnovski/mini.sessions", branch = "stable" },

	---------- Codesense

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
	},

	-- GitSigns
	{ "lewis6991/gitsigns.nvim" },

	-- Fugitive <3
	{ "tpope/vim-fugitive" },

	-- Move
	{ "fedepujol/move.nvim" },

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		-- build = ":TSUpdate",
	},

	-- RIP null-ls
	{
		"stevearc/conform.nvim",
		opts = {},
	},

	---------- Usability
	-- FZF
	{ "junegunn/fzf", run = ":call fzf#install()" },
	{ "junegunn/fzf.vim" },

	-- Whichkey
	{ "folke/which-key.nvim" },

	-- Telescope
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	---------- Misc
	{ "ellisonleao/glow.nvim" },
	{ "folke/neodev.nvim" },
	{ "lervag/vimtex" },
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},

	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},

	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = true,
		opts = ...,
	},

	{ "kkoomen/vim-doge" },

	{
		"iabdelkareem/csharp.nvim",
		dependencies = {
			"williamboman/mason.nvim", -- Required, automatically installs omnisharp
			"mfussenegger/nvim-dap",
			"Tastyep/structlog.nvim", -- Optional, but highly recommended for debugging
		},
		config = function()
			require("mason").setup() -- Mason setup must run before csharp, only if you want to use omnisharp
			require("csharp").setup()
		end,
	},

	{
		"kdheepak/lazygit.nvim",
		lazy = false,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	},
}

require("lazy").setup({
	spec = spec,

	checker = {
		enabled = true,
	},
})
