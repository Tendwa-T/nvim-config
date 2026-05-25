return {
  "Mofiqul/vscode.nvim",
  name = "vscode",
  priority = 1000, -- Load before other UI elements
  config = function()
    require("vscode").setup({
      -- Enable Ghostty's background to shine through (set to false if you want pure VS Code dark gray)
      transparent = true,

      -- Enable VS Code style italics for comments
      italic_comments = true,

      -- Disable Neovim's default background on floating windows to keep it looking like VS Code
      disable_nvimtree_bg = true,
    })

    -- Activate the theme
    vim.cmd.colorscheme("vscode")
  end,
}
