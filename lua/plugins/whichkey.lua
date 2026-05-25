return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        local which_key = require("which-key")

        which_key.setup({
            preset = "modern",
            delay = 200,
            win = {
                border = "rounded",
            },
        })

        which_key.add({
            { "<leader>e",  desc = "Toggle File Explorer" },
            { "<leader>E",  desc = "Focus File Explorer" },
            { "<leader>td", desc = "Toggle Diagnostics" },
            { "<leader>m",  group = "Markdown" },
            { "<leader>mt", desc = "Toggle Markdown Render" },
            { "<leader>l",  group = "Lint/Format" },
            { "<leader>lf", desc = "Format Buffer" },
            { "<leader>ll", desc = "Lint Buffer" },
            { "<leader>li", desc = "Formatter Info" },
            { "<leader>h",  group = "Git" },
            { "<leader>gs", desc = "LazyGit Status UI" },
            { "<leader>gp", desc = "LazyGit Push UI" },
            { "<leader>gP", desc = "LazyGit Current File" },
            { "<leader>gl", desc = "LazyGit Log" },
            { "<leader>gf", desc = "LazyGit Filter Commits" },
            { "<leader>gF", desc = "LazyGit Filter Current File" },
            { "<leader>gc", desc = "LazyGit Config" },
            { "<leader>hs", desc = "Stage Hunk" },
            { "<leader>hr", desc = "Reset Hunk" },
            { "<leader>hS", desc = "Stage Buffer" },
            { "<leader>hu", desc = "Undo Stage Hunk" },
            { "<leader>hp", desc = "Preview Hunk" },
            { "<leader>hb", desc = "Blame Line" },
            { "<leader>hd", desc = "Diff This" },
            { "<leader>hD", desc = "Diff Against HEAD" },
            { "<leader>gr", desc = "LazyGit Repo Picker" },
            { "<leader>f",  group = "Find" },
            { "<leader>ff", desc = "Find Files" },
            { "<leader>fg", desc = "Live Grep" },
            { "<leader>fb", desc = "Buffers" },
            { "<leader>fh", desc = "Help Tags" },
            { "og",         desc = "Toggle OpenCode Chat" },
            { "oo",         desc = "OpenCode Output" },
            { "o/",         desc = "Quick Buffer Chat",          mode = { "n", "x" } },
        })
    end,
}
