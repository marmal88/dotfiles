-- mason config
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'pyright',
        'bashls',
        'terraformls',
        'tflint',
        'lua_ls'
    }
})

-- lsp attach
local on_attach = function(_, _)
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end

-- activate language servers
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}


require('lspconfig').bashls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {'python'}
}

require('lspconfig').terraformls.setup {
    on_attach = on_attach,
    capabilties = capabilities,
    filetypes = {'hcl', 'tf'}
}

require('lspconfig').tflint.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
