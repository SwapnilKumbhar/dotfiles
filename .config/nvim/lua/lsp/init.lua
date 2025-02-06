-- All things mason and lspconfig will be here

local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

local handlers = require("lsp.handlers")

-- Update servers here as you want
local servers = {
	"pyright",
	"ts_ls",
	"lua_ls",
	"dockerls",
	"clangd",
	"rust_analyzer",
	"tailwindcss",
	"cmake",
	"ltex",
	"gopls",
	-- Linters
}

require("mason-lspconfig").setup({
	ensure_installed = servers,
})

local cfg = require("lspconfig")

-- Setup basic options first
handlers.setup()

for _, server in pairs(servers) do
	local opts = {
		on_attach = handlers.on_attach,
		capabilities = handlers.capabilities,
	}

	-- Check for server specific settings
	local set_ok, settings = pcall(require, "lsp.cfgs." .. server)
	if set_ok then
		opts = vim.tbl_deep_extend("force", settings, opts)
	end

	cfg[server].setup(opts)
end
