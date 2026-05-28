return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "saghen/blink.cmp",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "ts_ls", "eslint", "jdtls" },
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettier",
        "eslint_d",
        "java-debug-adapter",
        "java-test",
      },
      auto_update = false,
      run_on_start = true,
    })

    local capabilities = require("blink.cmp").get_lsp_capabilities()

    vim.lsp.config("ts_ls", {
      capabilities = capabilities,
      root_markers = {
        "package.json",
        "tsconfig.json",
        "jsconfig.json",
        ".git",
      },
      init_options = {
        preferences = {
          includePackageJsonAutoImports = "auto",
          includeCompletionsForModuleExports = true,
          includeCompletionsForImportStatements = true,
        },
      },
    })
    vim.lsp.enable("ts_ls")

    vim.lsp.config("eslint", {
      capabilities = capabilities,
      root_markers = {
        "eslint.config.js",
        "eslint.config.mjs",
        "eslint.config.cjs",
        ".eslintrc",
        ".eslintrc.js",
        ".eslintrc.cjs",
        ".eslintrc.json",
        "package.json",
        ".git",
      },
      settings = {
        workingDirectory = { mode = "auto" },
      },
    })
    vim.lsp.enable("eslint")

    vim.diagnostic.config({
      float = { border = "rounded", source = "if_many" },
      severity_sort = true,
      signs = true,
      underline = true,
      virtual_text = { spacing = 2, prefix = "●" },
      update_in_insert = false,
    })

    local function toggle_diagnostics()
      local enabled = vim.diagnostic.is_enabled({ bufnr = 0 })
      vim.diagnostic.enable(not enabled, { bufnr = 0 })
    end

    local function toggle_inlay_hints()
      if not vim.lsp.inlay_hint then
        return
      end

      local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
      vim.lsp.inlay_hint.enable(not enabled, { bufnr = 0 })
    end

    vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
    vim.keymap.set("n", "[d", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, { desc = "Previous Diagnostic" })
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, { desc = "Next Diagnostic" })
    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover({ border = "rounded" })
    end, { desc = "Hover Documentation" })
    vim.keymap.set("i", "<C-s>", function()
      vim.lsp.buf.signature_help({ border = "rounded" })
    end, { desc = "Signature Help" })
    vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename Symbol" })
    vim.keymap.set("n", "<leader>lh", function()
      vim.lsp.buf.signature_help({ border = "rounded" })
    end, { desc = "Signature Help" })
    vim.keymap.set("n", "<leader>lq", vim.diagnostic.setloclist, { desc = "Diagnostics to Location List" })
    vim.keymap.set("n", "<leader>lQ", vim.diagnostic.setqflist, { desc = "Diagnostics to Quickfix" })
    vim.keymap.set("n", "<leader>td", toggle_diagnostics, { desc = "Toggle Diagnostics" })
    vim.keymap.set("n", "<leader>th", toggle_inlay_hints, { desc = "Toggle Inlay Hints" })

    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "Enable LSP niceties when supported",
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
        end
      end,
    })
  end,
}
