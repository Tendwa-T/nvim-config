-- Define the path to where Lazy will be installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Clone Lazy if it isn't already installed
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Tell Lazy to load everything in the lua/plugins folder
require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    checker = { enabled = true }, -- Automatically check for plugin updates
})
