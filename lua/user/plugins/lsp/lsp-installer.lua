local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
local handlers = require('user.plugins.lsp.handlers')
if not status_ok then
    return
end

local servers = {"sumneko_lua", "volar", "vls", "eslint", "tsserver"}

local settings = {
    ensure_installed = servers,
    log_level = vim.log.levels.INFO
}

lsp_installer.setup(settings)

local opts = {}

for _, server in pairs(servers) do
    opts = {
        capabilities = handlers.capabilities
    }

    if server == 'sumneko_lua' then
        local sumneko_opts = require('user.plugins.lsp.settings.sumneko_lua')
        opts = vim.tbl_deep_extend('force', sumneko_opts, opts)
    end

    require('lspconfig')[server].setup(opts)
end

