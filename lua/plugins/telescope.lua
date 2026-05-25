return {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- Optional but highly recommended: Compiles native C for blazing fast sorting
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                -- Set up an elegant, compact layout that fits perfectly inside Ghostty
                layout_strategy = "horizontal",
                layout_config = {
                    preview_width = 0.55,
                    horizontal = {
                        size = {
                            width = "95%",
                            height = "95%",
                        },
                    },
                },
                -- Automatically ignore heavy directories that slow down searches
                file_ignore_patterns = {
                    "node_modules/",
                    ".git/",
                    ".dart_tool/",
                    "build/",
                    "target/", -- For Java Spring Boot build outputs
                    ".gradle/",
                },
            },
        })

        local previewers_utils = require("telescope.previewers.utils")

        previewers_utils.ts_highlighter = function(bufnr, ft)
            if ft == nil or ft == "" then
                return false
            end

            local lang = vim.treesitter.language.get_lang(ft) or ft
            if lang and vim.treesitter.language.add(lang) then
                return pcall(vim.treesitter.start, bufnr, lang)
            end

            return false
        end

        -- Load the fast native sorter if compiled successfully
        pcall(telescope.load_extension, "fzf")

        -- Keymaps for rapid muscle memory navigation
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep Text across files" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "List Active Buffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search Help Documentation" })
    end,
}
