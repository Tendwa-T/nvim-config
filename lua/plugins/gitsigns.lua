return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("gitsigns").setup({
            signs = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "▎" },
                topdelete = { text = "▔" },
                changedelete = { text = "▎" },
            },
            on_attach = function(bufnr)
                local gitsigns = package.loaded.gitsigns

                local function map(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
                end

                map("n", "]c", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "]c", bang = true })
                    else
                        gitsigns.next_hunk()
                    end
                end, "Next Git Hunk")

                map("n", "[c", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "[c", bang = true })
                    else
                        gitsigns.prev_hunk()
                    end
                end, "Previous Git Hunk")

                map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
                map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
                map("n", "<leader>hS", gitsigns.stage_buffer, "Stage Buffer")
                map("n", "<leader>hu", gitsigns.undo_stage_hunk, "Undo Stage Hunk")
                map("n", "<leader>hp", gitsigns.preview_hunk, "Preview Hunk")
                map("n", "<leader>hb", function()
                    gitsigns.blame_line({ full = true })
                end, "Blame Line")
                map("n", "<leader>hd", gitsigns.diffthis, "Diff This")
                map("n", "<leader>hD", function()
                    gitsigns.diffthis("~")
                end, "Diff Against HEAD")
            end,
        })
    end,
}
