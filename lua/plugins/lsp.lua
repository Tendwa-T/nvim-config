return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      -- ts_ls is for NestJS, jdtls for Java
      ensure_installed = { "ts_ls", "eslint", "jdtls" },
    })

    -- Register the TypeScript server with the native LSP API.
    vim.lsp.config("ts_ls", {})
    vim.lsp.enable("ts_ls")

    vim.diagnostic.config({
      float = { border = "rounded", source = "if_many" },
      severity_sort = true,
      signs = true,
      underline = true,
      virtual_text = { spacing = 2, prefix = "●" },
      update_in_insert = false,
    })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })

    local function toggle_diagnostics()
      local enabled = vim.diagnostic.is_enabled({ bufnr = 0 })
      vim.diagnostic.enable(not enabled, { bufnr = 0 })
    end

    vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Hover Error Details" })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Error" })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Error" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
    vim.keymap.set("n", "<leader>td", toggle_diagnostics, { desc = "Toggle Diagnostics" })
  end,
}
