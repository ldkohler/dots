vim.diagnostic.config({
  float = {
    format = function(diagnostic)
      return ("%s (%s)"):format(diagnostic.message, diagnostic.source)
    end,
    header = "",
    prefix = " ",
  },
})

local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
end

vim.lsp.config("*", {
  on_attach = on_attach,
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})

local servers = {
  "lua_ls",
  "pyright",
  "gopls",
  "rust_analyzer",
  "clangd",
  "ts_ls",
  "html",
  "cssls",
}

for _, server in ipairs(servers) do
  vim.lsp.config(server, {})
  vim.lsp.enable(server)
end
