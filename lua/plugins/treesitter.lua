return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" }, -- Lazy load: only starts when you open a file
    config = function()
        local filetypes = {
            "dart",
            "typescript",
            "tsx",
            "java",
            "javascript",
            "jsx",
            "json",
            "jsonc",
            "yaml",
            "markdown",
            "markdown_inline",
            "html",
            "css",
            "scss",
            "graphql",
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
