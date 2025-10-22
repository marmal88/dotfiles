return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "folke/neodev.nvim",
    },
    config = function()
        require('neodev').setup()

        local opts = { noremap = true, silent = true }
        local on_attach = function(_, bufnr)
            opts.buffer = bufnr
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

        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local servers = {
            'pyright',
            'bashls',
            'terraformls',
            'tflint',
            'lua_ls',
            'jsonls',
            'vimls',
        }
        require("mason").setup()
        require('mason-lspconfig').setup(
            {
                automatic_installation = true,
                ensure_installed = servers,
            }
        )

        -- Loop through the servers list and set them up with the same on_attach and capabilities
        for _, server_name in ipairs(servers) do
            require('lspconfig')[server_name].setup {
                on_attach = on_attach,       -- This USES the on_attach function
                capabilities = capabilities, -- This USES the capabilities table
            }
        end

    end,
}
