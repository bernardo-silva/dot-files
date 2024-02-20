local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok, mlsp_config = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end
-- require "user.lsp.lsp-installer"
require("user.lsp.handlers").setup()
mason.setup()
mlsp_config.setup()
mlsp_config.setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    ["rust_analyzer"] = function ()
        require("rust-tools").setup {}
    end
}
require "user.lsp.null-ls"

for i, server in pairs(mlsp_config.get_installed_servers()) do
    lspconfig[server].setup {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }
end

