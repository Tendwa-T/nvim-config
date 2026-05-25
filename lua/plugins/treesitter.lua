return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" }, -- Lazy load: only starts when you open a file
    config = function()
        local filetypes = {
            "dart",
            "typescript",
            "java",
            "javascript",
            "json",
            "yaml",
            "markdown",
            "html",
            "css",
            "lua",
            "vim",
            "vimdoc",
        }

        vim.api.nvim_create_autocmd("FileType", {
            pattern = filetypes,
            callback = function()
                pcall(vim.treesitter.start)
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
