return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>lf",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
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
            javascript = { "prettier" },
            json = { "prettier" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
    },
}
