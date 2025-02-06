-- Utilities for creating configurations
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		typescript = { "eslint_d", "prettierd" },
		javascript = { "eslint_d", "prettierd" },
		typescriptreact = { "eslint_d", "prettierd" },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
