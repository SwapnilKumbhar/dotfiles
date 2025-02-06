local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local nls = require("null-ls")

-- Just shorthands
local fmt = nls.builtins.formatting

-- Sources
local sources = {
  fmt.stylua,
  fmt.black,
  fmt.clang_format.with({
    extra_args = { "--style", "Mozilla" },
  }),
  fmt.eslint_d,
  fmt.rustfmt,
  fmt.gofmt,
}

-- Setup
nls.setup({
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          local pos = vim.fn.getpos(".")
          vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 1000 })

          -- For CPP, clang-format with styles like Mozilla, the cursor moves to a
          -- different position after formatting. I don't know why this happens but
          -- this is a quick fix for that.
          local ft = vim.bo.filetype
          if ft == "cpp" or ft == "c" or ft == "cuda" then
            vim.fn.setpos(".", pos)
          end
        end,
      })
    end
  end,
})
