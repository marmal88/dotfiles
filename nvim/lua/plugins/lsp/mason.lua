return {
    "williamboman/mason.nvim",
    opts = {
        ensure_installed = {
            "tflint",
            "terraform",
            "pyright",
            "flake8",
        },
    },
    config = function()
        require('mason').setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })
    end,
    handlers = {
    terraformls = function()
        require('lspconfig').terraformls.setup({
                root_dir = function()
                    -- Get the directory containing the current file
                    local current_file = vim.fn.expand("%:p") -- Absolute path to current file
                    local project_root = vim.fn.fnamemodify(current_file, ":h") -- Directory containing the file
                    return project_root
                end,
                init_options = {
                    experimentalFeatures = {
                        semanticCompletion = true
                    }
                }
            })
        end
    },
}
