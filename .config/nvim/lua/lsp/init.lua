local handlers = require("lsp.handlers")

-- Update servers here as you want
local servers = {
	"pyright",
	"lua_ls",
	"dockerls",
	"clangd",
	"rust_analyzer",
	-- "tailwindcss", -- Too noisy
	"cmake",
	"ltex",
	"gopls",
	"omnisharp",
	"powershell_es",
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
