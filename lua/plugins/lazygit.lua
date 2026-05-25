return {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitLog",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    keys = {
        {
            "<leader>gs",
            "<cmd>LazyGit<cr>",
            desc = "LazyGit Status UI",
        },
        {
            "<leader>gP",
            "<cmd>LazyGitCurrentFile<cr>",
            desc = "LazyGit Current File",
        },
        {
            "<leader>gl",
            "<cmd>LazyGitLog<cr>",
            desc = "LazyGit Log",
        },
        {
            "<leader>gf",
            "<cmd>LazyGitFilter<cr>",
            desc = "LazyGit Filter Commits",
        },
        {
            "<leader>gF",
            "<cmd>LazyGitFilterCurrentFile<cr>",
            desc = "LazyGit Filter Current File",
        },
        {
            "<leader>gc",
            "<cmd>LazyGitConfig<cr>",
            desc = "LazyGit Config",
        },
        {
            "<leader>gr",
            function()
                require("telescope").extensions.lazygit.lazygit()
            end,
            desc = "LazyGit Repo Picker",
        },
        {
            "<leader>gp",
            "<cmd>LazyGit<cr>",
            desc = "LazyGit Push UI",
        },
    },
    config = function()
        require("telescope").load_extension("lazygit")
    end,
}
