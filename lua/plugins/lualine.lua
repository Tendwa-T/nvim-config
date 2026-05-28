return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "vscode", -- Automatically matches your current colorscheme

        -- Smooth, rounded separators for a premium UI feel
        component_separators = { left = '│', right = '│' },
        section_separators = { left = '', right = '' },

        -- Keeps a single, unified status bar spanning the entire bottom of the terminal
        globalstatus = true,

        -- Keep transient picker/dashboard windows uncluttered.
        disabled_filetypes = {
          statusline = { "snacks_picker_list", "snacks_dashboard", "alpha" },
        },
      },
      sections = {
        -- Left side
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
          {
            'filename',
            path = 1, -- Shows the relative path (e.g., src/main.dart) instead of just the filename
          }
        },

        -- Right side
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
    })
  end,
}
