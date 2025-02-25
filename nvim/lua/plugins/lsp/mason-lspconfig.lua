return {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        local mason_lspconfig = require("mason-lspconfig")

        mason_lspconfig.setup {
            ensure_installed = {
                "terraformls",
                "pyright",
                "bashls",
                "lua_ls",
                "tflint",
            },
        }

        local lspconfig = require('lspconfig')

        -- Common configuration (without semanticCompletion for tflint compatibility)
        local common_lsp_config = {
            root_dir = function(fname)
                -- Start at the file's directory
                local current_dir = vim.fn.fnamemodify(fname, ":h")
                local found = false
                local root_dir = current_dir

                -- Traverse upwards until terragrunt.hcl is found, or until the root is reached.
                while root_dir ~= "" and root_dir ~= "/" do
                    if vim.fn.filereadable(root_dir .. "/terragrunt.hcl") == "1" then
                        found = true
                        break
                    end

                    -- Move one directory up
                    root_dir = vim.fn.fnamemodify(root_dir, ":h")
                end

                if found then
                    return root_dir
                else
                    -- If terragrunt.hcl was not found, return the current directory.
                    return current_dir
                end
            end
        }

        -- Custom terraformls configuration:
        lspconfig.terraformls.setup(vim.tbl_deep_extend('force', common_lsp_config, {
            init_options = {
                experimentalFeatures = {
                    semanticCompletion = true
                }
            }
        }))

        -- Setup tflint with the common configuration
        lspconfig.tflint.setup(common_lsp_config)

    end,
}
