return {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                -- Load luvit types when the `vim.uv` word is found
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
    { "Bilal2453/luvit-meta", lazy = true },
    {
        -- Main LSP Configuration
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Allows extra capabilities provided by nvim-cmp
            'saghen/blink.cmp'
        },
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
                callback = function(event)
                    -- NOTE: Remember that Lua is a real programming language, and as such it is possible
                    -- to define small helper and utility functions so you don't have to repeat yourself.
                    --
                    -- In this case, we create a function that lets us more easily define mappings specific
                    -- for LSP related items. It sets the mode, buffer and description for us each time.
                    local map = function(keys, func, desc, mode)
                        mode = mode or "n"
                        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                    end

                    -- Jump to the definition of the word under your cursor.
                    map("gd", "<cmd>FzfLua lsp_definitions<cr>", "[G]oto [D]efinition")
                    -- Find references for the word under your cursor.
                    map("gr", "<cmd>FzfLua lsp_references<cr>", "[G]oto [R]eferences")
                    -- Jump to the implementation of the word under your cursor.
                    map("gI", "<cmd>FzfLua lsp_implementations<cr>", "[G]oto [I]mplementation")
                    -- Jump to the type of the word under your cursor.
                    map("gtd", "<cmd>FzfLua lsp_typedefs<cr>", "[G]oto [T]ype [D]efinition")
                    -- end
                    -- Rename the variable under your cursor.
                    map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                    -- Execute a code action, usually your cursor needs to be on top of an error
                    -- or a suggestion from your LSP for this to activate.
                    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
                    -- WARN: This is not Goto Definition, this is Goto Declaration.
                    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                end,
            })

            -- -- LSP servers and clients are able to communicate to each other what features they support.
            -- --  By default, Neovim doesn't support everything that is in the LSP specification.
            -- --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
            -- --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
            -- local capabilities = vim.lsp.protocol.make_client_capabilities()
            -- capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

            local servers = {
                -- Haskell
                hls = {
                    filetypes = { 'haskell', 'lhaskell', 'cabal' },
                    command = { "haskell-language-server-wrapper", "--lsp" },
                },

                -- C & C++
                clangd = {
                    root_dir = function(fname)
                        return require("lspconfig.util").root_pattern(
                            "Makefile",
                            "configure.ac",
                            "configure.in",
                            "config.h.in",
                            "meson.build",
                            "meson_options.txt",
                            "build.ninja"
                        )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
                            fname
                        ) or vim.fs.dirname(vim.fs.find('.git', { path = fname, upward = true })[1])
                    end,
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--clang-tidy",
                        "--header-insertion=iwyu",
                        "--completion-style=detailed",
                        "--function-arg-placeholders",
                        "--fallback-style=llvm",
                    },
                    init_options = {
                        usePlaceholders = true,
                        completeUnimported = true,
                        clangdFileStatus = true,
                    },
                },

                -- Rust
                rust_analyzer = {
                    settings = {
                        ["rust-analyzer"] = {
                            checkOnSave = { enable = true, },
                            diagnostics = { enable = true, },
                            check = {
                                command = "clippy",
                            },
                        },
                    },
                },
                -- bacon_ls = {
                --     enabled = true,
                --     autostart = true,
                --     settings = {
                --         -- locationsFile = ".locations",
                --         baconSettings = {
                --             spawn = true,
                --             command = "bacon clippy -- --all-features"
                --         }
                --     },
                -- },

                -- Zig
                zls = {
                    filetypes = { "zig", "zir", "zon" },
                    settings = {
                        ["enable_build_on_save"] = true,
                    },
                },

                -- Markdown
                marksman = {},

                -- Asembly
                asm_lsp = {},

                -- Typst
                tinymist = {
                    single_file_support = true,
                    root_dir = function()
                        return vim.fn.getcwd()
                    end,
                    filetypes = { "typst" },
                    settings = {
                        exportPdf = "onType",
                        outputPath = "$root/$dir/$name",
                        formatterMode = "typstyle",
                    },
                },

                -- LaTex
                texlab = {
                    filetypes = { "latex", "markdown" },
                },

                -- Lua
                lua_ls = {
                    -- cmd = {...},
                    -- filetypes = { ...},
                    -- capabilities = {},
                    settings = {
                        Lua = {
                            completion = {
                                callSnippet = "Replace",
                            },
                            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                            -- diagnostics = { disable = { 'missing-fields' } },
                        },
                    },
                },

                -- Nushell
                nushell = {},

                -- Python
                pyright = {
                    single_file_support = true,
                },
            }
            for server, config in pairs(servers) do
                config.capabilities = require 'blink.cmp'.get_lsp_capabilities(config.capabilities)
                -- config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
                require 'lspconfig'[server].setup(config)
            end
        end,
    },

    { -- Autoformat
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({ async = true, lsp_format = "fallback" })
                end,
                mode = "",
                desc = "[F]ormat buffer",
            },
        },
        opts = {
            notify_on_error = false,
            format_on_save = function(bufnr)
                -- Disable "format_on_save lsp_fallback" for languages that don't
                -- have a well standardized coding style. You can add additional
                -- languages here or re-enable it for the disabled ones.
                local lsp_format_opt = "fallback"
                return {
                    timeout_ms = 500,
                    lsp_format = lsp_format_opt,
                }
            end,
            formatters_by_ft = {
                -- Conform can also run multiple formatters sequentially
                -- python = { "isort", "black" },
                typst = { "typstyle", "typstfmt", stop_after_first = true },
                -- lua = { "stylua" },
                -- You can use 'stop_after_first' to run the first available formatter from the list
                -- javascript = { "prettierd", "prettier", stop_after_first = true },
            },
        },
    },
}
