return {
    'stevearc/conform.nvim',
    dependencies = { 'mason,nvim' },
    cmd = "ConformInfo",
    keys = {
        {
            "<leader>cF",
            function()
                require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
            end,
            mode = { "n", "v" },
            desc = "Format Injected Langs",
        },
    },
    config = function()
        require("conform").setup {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "ruff", "flake8" },
                terraform = { "tflint" },
                bash = { "bashls" }
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
            notify_on_error = true,
        }
    end
}
