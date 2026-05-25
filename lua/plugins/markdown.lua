return {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    keys = {
        { "<leader>mt", "<cmd>RenderMarkdown buf_toggle<cr>", desc = "Toggle Markdown Render" },
    },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-mini/mini.icons",
    },
    opts = {},
}
