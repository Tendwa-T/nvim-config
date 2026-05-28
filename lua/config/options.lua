-- luacheck: globals vim
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.breakindent = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 400
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.list = true
vim.opt.listchars = {
  tab = "  ",
  trail = "·",
  extends = ">",
  precedes = "<",
  nbsp = "+",
}

vim.opt.wildignore:append({
  "*/node_modules/*",
  "*/.git/*",
  "*/.dart_tool/*",
  "*/build/*",
  "*/target/*",
  "*/.gradle/*",
})

vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit Insert Mode" })

-- Set the leader key to Space.
vim.g.mapleader = " "
vim.g.maplocalleader = " "
