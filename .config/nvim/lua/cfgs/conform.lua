-- Utilities for creating configurations
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		typescript = { "prettierd", stop_after_first = false },
		javascript = { "prettierd", stop_after_first = false },
		bash = { "beautysh" },
		rust = { "rustfmt" },
		c = { "clang-format" },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 1000,
		lsp_format = "fallback",
	},
})
