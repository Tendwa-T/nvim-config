return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- Renders file icons (requires a Nerd Font in Ghostty)
        "MunifTanjim/nui.nvim",        -- UI component library
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true, -- Automatically close Nvim if Neo-tree is the only window left
            popup_border_style = "rounded",
            enable_git_status = true,    -- Shows file modifications in the tree
            enable_diagnostics = true,   -- Shows LSP errors (like missing Flutter imports)

            default_component_configs = {
                indent = {
                    with_markers = true,
                    with_expanders = true, -- Sleek expand/collapse arrows for folders
                    expander_collapsed = "",
                    expander_expanded = "",
                },
                -- Clean, explicit Git indicators for your manual workflow
                git_status = {
                    symbols = {
                        added     = "✚",
                        modified  = "",
                        deleted   = "✖",
                        renamed   = "󰁕",
                        untracked = "",
                        ignored   = "",
                        unstaged  = "󰄱",
                        staged    = "",
                        conflict  = "",
                    }
                },
            },

            window = {
                position = "left",
                width = 35,
                mappings = {
                    -- Fluid navigation: use Enter or 'l' to open, 'h' to collapse
                    ["<cr>"] = "open",
                    ["l"] = "open",
                    ["h"] = "close_node",

                    -- File operations
                    ["a"] = { "add", config = { show_path = "none" } },
                    ["d"] = "delete",
                    ["r"] = "rename",
                    ["c"] = "copy",
                    ["m"] = "move",
                }
            },

            filesystem = {
                filtered_items = {
                    visible = false,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                    always_show = { ".env" }, -- Always keep environment variables visible
                    hide_by_name = {
                        "node_modules",
                        ".dart_tool",
                        "build",
                        "target",
                    },
                },
                -- Automatically focuses the file you are currently editing in the tree
                follow_current_file = {
                    enabled = true,
                },
                -- Uses your OS file system watcher for instantaneous updates
                use_libuv_file_watcher = true,
            },
        })

        -- Toggle the explorer, or focus it on the current file when needed.
        vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>", { desc = "Toggle File Explorer" })
        vim.keymap.set("n", "<leader>E", "<Cmd>Neotree focus reveal_force_cwd<CR>", { desc = "Focus File Explorer" })
    end,
}
