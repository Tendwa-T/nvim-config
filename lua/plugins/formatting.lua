return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>lf",
            function()
                require("conform").format({ async = true, lsp_format = "fallback" })
            end,
            desc = "Format Buffer",
        },
        {
            "<leader>li",
            "<cmd>ConformInfo<cr>",
            desc = "Formatter Info",
        },
    },
    opts = {
        formatters_by_ft = {
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
            javascript = { "prettier" },
            javascriptreact = { "prettier" },
            json = { "prettier" },
            jsonc = { "prettier" },
            css = { "prettier" },
            scss = { "prettier" },
            html = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
            graphql = { "prettier" },
            dart = {},
            java = {},
        },
        format_on_save = {
            timeout_ms = 1000,
            lsp_format = "fallback",
        },
    },
    config = function(_, opts)
        require("conform").setup(opts)
    end,
}
