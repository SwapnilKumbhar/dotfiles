local cf = require("conform")

cf.setup({
	formatters_by_ft = {
		python = { "black" },
		lua = { "stylua" },
		typescript = { "eslint", "prettierd", stop_after_first = false },
		javascript = { "eslint", "prettierd", stop_after_first = false },
		bash = { "beautysh" },
		rust = { "rustfmt" },
		c = { "clang-format" },
	},
	format_on_save = {
		timeout_ms = 1000,
		lsp_fallback = true,
	},
})
