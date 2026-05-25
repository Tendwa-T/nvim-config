return {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "stevearc/dressing.nvim", -- Provides a nice UI for selecting emulators
    },
    config = function()
        require("flutter-tools").setup({
            debugger = {
                enabled = true,
                run_via_dap = true, -- Integrates with nvim-dap for debugging
            },
            widget_guides = {
                enabled = true, -- Draws indentation lines for Flutter widget trees
            },
            dev_log = {
                enabled = true,
                open_cmd = "tabedit", -- Opens Flutter logs in a new tab
            },
        })
    end,
}
