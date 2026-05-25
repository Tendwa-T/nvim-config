return {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
        window = {
            width = 120, -- Width of the focused code window
            options = {
                number = true,
                relativenumber = true,
                signcolumn = "no",
            }
        },
        plugins = {
            gitsigns = { enabled = false }, -- Hide git indicators
            tmux = { enabled = false },
        }
    }
}
