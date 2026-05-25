return {
    "mfussenegger/nvim-lint",
    event = { "BufWritePost", "InsertLeave" },
    keys = {
        {
            "<leader>ll",
            function()
                require("lint").try_lint()
            end,
            desc = "Lint Buffer",
        },
    },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            javascript = { "eslint" },
            javascriptreact = { "eslint" },
            typescript = { "eslint" },
            typescriptreact = { "eslint" },
        }

        vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
