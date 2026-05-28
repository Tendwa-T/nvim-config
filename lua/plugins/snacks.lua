return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    explorer = {
      enabled = true,
      replace_netrw = true,
    },
    input = { enabled = true },
    lazygit = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    picker = {
      enabled = true,
      formatters = {
        file = {
          filename_first = false,
          truncate = "center",
        },
      },
      matcher = {
        frecency = true,
        history_bonus = true,
      },
      sources = {
        explorer = {
          hidden = true,
          ignored = false,
          layout = {
            preset = "sidebar",
            preview = false,
          },
        },
        files = {
          hidden = true,
          ignored = false,
        },
      },
    },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    { "<leader>e", function() Snacks.explorer() end, desc = "Toggle File Explorer" },
    { "<leader>E", function() Snacks.explorer.reveal() end, desc = "Reveal Current File" },

    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Live Grep" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>fh", function() Snacks.picker.help() end, desc = "Help" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent Files" },
    { "<leader>fw", function() Snacks.picker.grep_word() end, mode = { "n", "x" }, desc = "Grep Word/Selection" },
    { "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Workspace Diagnostics" },
    { "<leader>fD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    { "<leader>fs", function() Snacks.picker.lsp_symbols() end, desc = "Document Symbols" },
    { "<leader>fS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Workspace Symbols" },
    { "<leader>fp", function() Snacks.picker.files({ pattern = "package.json" }) end, desc = "Find package.json" },
    { "<leader>fR", function() Snacks.picker.resume() end, desc = "Resume Picker" },

    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Go to Definition" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Go to Declaration" },
    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Implementations" },
    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Type Definition" },
    { "gai", function() Snacks.picker.lsp_incoming_calls() end, desc = "Incoming Calls" },
    { "gao", function() Snacks.picker.lsp_outgoing_calls() end, desc = "Outgoing Calls" },

    { "<leader>gs", function() Snacks.lazygit() end, desc = "LazyGit" },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
    { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log Current File" },
    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff Hunks" },
    { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },

    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss Notifications" },
    { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference" },
    { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Previous Reference" },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        Snacks.toggle.diagnostics():map("<leader>td")
        Snacks.toggle.inlay_hints():map("<leader>th")
        Snacks.toggle.line_number():map("<leader>tn")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>tr")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>tw")
      end,
    })
  end,
}
