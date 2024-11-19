return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            bigfile = { enabled = true },
            quickfile = { enabled = true },
            statuscolumn = {
                enabled = true,
                folds = {
                    open = true,    -- show open fold icons
                    git_hl = false, -- use Git Signs hl for fold icons
                },
            },
            dashboard = { enabled = true },
            notifier = { enabled = true },
            words = { enabled = false },
        },
        init = function()
            -- Lsp loading for snacks notifier
            vim.api.nvim_create_autocmd("LspProgress", {
                ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
                callback = function(ev)
                    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
                    vim.notify(vim.lsp.status(), "info", {
                        id = "lsp_progress",
                        title = "LSP Progress",
                        opts = function(notif)
                            notif.icon = ev.data.params.value.kind == "end" and " "
                                or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
                        end,
                    })
                end,
            })
            local snacks = require "snacks"
            vim.api.nvim_create_autocmd("User", {
                pattern = "VeryLazy",
                callback = function()
                    -- Setup some globals for debugging (lazy-loaded)
                    _G.dd = function(...)
                        snacks.debug.inspect(...)
                    end
                    _G.bt = function()
                        snacks.debug.backtrace()
                    end
                    vim.print = _G.dd -- Override print to use snacks for `:=` command

                    -- Create some toggle mappings
                    snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>ct")
                    snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>tw")
                    snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>tL")
                    snacks.toggle.diagnostics():map("<leader>td")
                    snacks.toggle.line_number():map("<leader>tl")
                    snacks.toggle.option("conceallevel",
                        { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 3 }):map("<leader>tc")
                    snacks.toggle.treesitter():map("<leader>tT")
                    snacks.toggle.inlay_hints():map("<leader>th")
                end,
            })
        end,
    },
}
