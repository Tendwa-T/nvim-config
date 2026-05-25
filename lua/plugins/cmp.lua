return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- Only load when you start typing
    dependencies = {
        -- Snippet engine (required by nvim-cmp)
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",

        -- Completion sources
        "hrsh7th/cmp-nvim-lsp", -- Pulls completions from Mason (Flutter, NestJS, Java)
        "hrsh7th/cmp-buffer",   -- Pulls words from the current file
        "hrsh7th/cmp-path",     -- Autocompletes file paths

        -- UI enhancements
        "onsails/lspkind.nvim", -- Adds VS Code-style icons to the menu
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        cmp.setup({
            -- Required snippet engine setup
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            -- Clean, rounded UI for the completion and documentation windows
            window = {
                completion = cmp.config.window.bordered({
                    border = "rounded",
                    winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
                }),
                documentation = cmp.config.window.bordered({
                    border = "rounded",
                }),
            },

            -- High-fidelity formatting with icons
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol_text", -- Show icon AND text
                    maxwidth = 50,        -- Prevent menu from getting too wide
                    ellipsis_char = "...",
                }),
            },

            -- Muscle-memory keybindings
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(),         -- Move up
                ["<C-j>"] = cmp.mapping.select_next_item(),         -- Move down
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),            -- Scroll docs up
                ["<C-f>"] = cmp.mapping.scroll_docs(4),             -- Scroll docs down
                ["<C-Space>"] = cmp.mapping.complete(),             -- Manually trigger completion
                ["<C-e>"] = cmp.mapping.abort(),                    -- Close autocomplete
                ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Enter to confirm

                -- Super-Tab mapping for fluidly cycling through snippets
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),

            -- Order determines priority (LSP suggestions first)
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
            }, {
                { name = "buffer" },
                { name = "path" },
            }),
        })
    end,
}
