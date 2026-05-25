return {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    keys = {
        { "gcc", mode = "n", desc = "Toggle Line Comment" },
        { "gbc", mode = "n", desc = "Toggle Block Comment" },
        { "gc", mode = { "n", "x", "o" }, desc = "Comment Motion/Selection" },
        { "gb", mode = { "n", "x", "o" }, desc = "Block Comment Motion/Selection" },
    },
    config = function()
        require("Comment").setup()
    end,
}