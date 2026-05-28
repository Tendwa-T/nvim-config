return {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "stevearc/dressing.nvim", -- Provides a nice UI for selecting emulators
        "mfussenegger/nvim-dap",
    },
    keys = {
        { "<leader>Fr", "<cmd>FlutterRun<cr>", desc = "Flutter Run" },
        { "<leader>Fd", "<cmd>FlutterDebug<cr>", desc = "Flutter Debug" },
        { "<leader>Fq", "<cmd>FlutterQuit<cr>", desc = "Flutter Quit" },
        { "<leader>FR", "<cmd>FlutterReload<cr>", desc = "Flutter Hot Reload" },
        { "<leader>FS", "<cmd>FlutterRestart<cr>", desc = "Flutter Hot Restart" },
        { "<leader>FD", "<cmd>FlutterDevices<cr>", desc = "Flutter Devices" },
        { "<leader>FE", "<cmd>FlutterEmulators<cr>", desc = "Flutter Emulators" },
        { "<leader>Fo", "<cmd>FlutterOutlineToggle<cr>", desc = "Flutter Outline" },
        { "<leader>Fl", "<cmd>FlutterLogToggle<cr>", desc = "Flutter Dev Log" },
        { "<leader>Fc", "<cmd>FlutterLogClear<cr>", desc = "Clear Flutter Log" },
        {
            "<leader>Fp",
            function()
                vim.cmd("split | terminal flutter pub get")
            end,
            desc = "Flutter Pub Get",
        },
        { "<leader>Fa", "<cmd>FlutterReanalyze<cr>", desc = "Flutter Reanalyze" },
        { "<leader>FL", "<cmd>FlutterLspRestart<cr>", desc = "Restart Dart LSP" },
    },
    config = function()
        local capabilities = require("blink.cmp").get_lsp_capabilities()

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
            lsp = {
                capabilities = capabilities,
                settings = {
                    showTodos = true,
                    completeFunctionCalls = true,
                    renameFilesWithClasses = "prompt",
                    enableSnippets = true,
                    enableSdkFormatter = true,
                },
            },
        })
    end,
}
