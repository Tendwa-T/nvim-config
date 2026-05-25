-- luacheck: globals vim
vim.opt.termguicolors = true      -- Enables 24-bit RGB colors
vim.opt.number = true             -- Show absolute line numbers
vim.opt.relativenumber = true     -- Relative line numbers for fast jumping
vim.opt.expandtab = true          -- Convert tabs to spaces
vim.opt.shiftwidth = 2            -- 2 spaces for indentation
vim.opt.tabstop = 2
vim.opt.smartindent = true        -- Auto-indent new lines
vim.opt.clipboard = "unnamedplus" -- Sync with Mac clipboard
vim.opt.ignorecase = true         -- Case-insensitive search
vim.opt.smartcase = true          -- Case-sensitive if capital letter included

-- Set the leader key to Space (used for Telescope commands)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
