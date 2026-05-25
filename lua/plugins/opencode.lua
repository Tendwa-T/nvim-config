return {
    "sudo-tee/opencode.nvim",
    event = "VeryLazy",
    opts = {
        -- Automatically clean up the background agent when Neovim closes
        auto_kill = true,
    },
    keys = {
        {
            "og",
            function() require("opencode.api").toggle() end,
            desc = "Toggle OpenCode Chat Panel"
        },
        {
            "oo",
            function() require("opencode.api").open_output() end,
            desc = "Focus OpenCode Output Window"
        },
        {
            "o/",
            function() require("opencode.api").quick_chat() end,
            mode = { "n", "x" },
            desc = "Quick Buffer Chat (Injects current line or visual selection)"
        },
    },
}
