return {
    {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        dependencies = { "rafamadriz/friendly-snippets" },
        opts = {
            enable_autosnippets = true,
        },
        config = function(_, opts)
            ---@diagnostic disable: unused-local
            local ls = require "luasnip"
            ls.config.setup(opts)
            local s = ls.snippet
            local sn = ls.snippet_node
            local t = ls.text_node
            local i = ls.insert_node
            local f = ls.function_node
            local c = ls.choice_node
            local d = ls.dynamic_node
            local r = ls.restore_node
            local l = require("luasnip.extras").lambda
            local rep = require("luasnip.extras").rep
            local p = require("luasnip.extras").partial
            local m = require("luasnip.extras").match
            local n = require("luasnip.extras").nonempty
            local dl = require("luasnip.extras").dynamic_lambda
            local fmt = require("luasnip.extras.fmt").fmt
            local types = require("luasnip.util.types")
            local conds = require("luasnip.extras.conditions")
            local conds_expand = require("luasnip.extras.conditions.expand").snippet

            -- No easy way look into treesitter
            local function in_math()
                return true
            end

            ls.add_snippets("typst", {
                s("récurrence", fmt([[
                    Je raisonne par récurrence.

                    Pour tout $n in {}$, j'examine la proposition :
                    $ P(n) : {} $

                    // Initialisation :
                    $ {} $
                    La proposition $P(0)$ est vraie.

                    // Hérédité :
                    J'émets l'hypothèse de récurrence :
                    $ {} $

                    $
                      {}
                    $

                    Si $P(n)$ est vraie alors $P(n+1)$ l'est aussi.

                    // Conclusion :
                    L'hérédité et l'initialisation sont vérifiées
                    donc d'après le principe de récurrence la proposition
                    $P(n) : {}$
                    est vraie pour tout $n in {}$.
                ]],
                    {
                        i(1, "\"ensemble\""),
                        i(2, "\"proposition\""),
                        i(3, "\"initialisation\""),
                        rep(2),
                        i(0, "\"récurrence\""),
                        rep(2),
                        rep(1),
                    }
                )),
                s({ trig = "ùhl", snippetType = "autosnippet" }, fmt("#high[{}]", { i(0) })),
                s({ trig = "ùul", snippetType = "autosnippet" }, fmt("#und[{}]", { i(0) })),
                s({ trig = "ùt", snippetType = "autosnippet" }, fmt('#tab[{}]', { i(0) })),
                s(
                    { trig = "ùdi", snippetType = "autosnippet" },
                    fmt("({})/({})", { i(1), i(0) }),
                    { condition = in_math }
                ),
                s({ trig = "limn", snippetType = "autosnippet" }, fmt("lim_(n->+oo) {}", { i(0) })),
                s({ trig = "limx", snippetType = "autosnippet" }, fmt("lim_(x->{}) {}", { i(1, "+oo"), i(0) })),
                s({ trig = "mt", snippetType = "autosnippet" }, fmt("${}$", { i(0) })),
                s({ trig = "mmt", snippetType = "autosnippet" }, fmt("$ {} $", { i(0) })),
            }, {}
            )
            require "luasnip.loaders.from_vscode".lazy_load()
        end
    },
    {
        'saghen/blink.cmp',
        -- optional: provides snippets for the snippet source
        dependencies = {
            'hrsh7th/cmp-calc',
            'folke/lazydev.nvim',
            'rafamadriz/friendly-snippets',
        },

        -- use a release tag to download pre-built binaries
        version = '*',
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            cmdline = {
                completion = { menu = { auto_show = true, }, },
            },
            -- 'default' for mappings similar to built-in completion
            -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
            -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
            -- See the full "keymap" documentation for information on defining your own keymap.
            keymap = {
                preset = 'default',
                ['<C-space>'] = { 'select_and_accept' },
                ['<C-y>'] = { 'show', 'show_documentation', 'hide_documentation' },
                -- ['<C-l>'] = { 'snippet_forward', 'fallback' },
                -- ['<C-h>'] = { 'snippet_backward', 'fallback' },
            },

            appearance = {
                -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = 'normal'
            },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            snippets = { preset = 'luasnip' },
            sources = {
                default = { 'snippets', 'lazydev', 'lsp', 'path', 'calc' },
                -- default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer', 'calc' },

                providers = {
                    calc = {
                        name = 'calc',
                        module = 'blink.compat.source',
                    },
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        -- make lazydev completions top priority (see `:h blink.cmp`)
                        score_offset = 100,
                    },
                },
            },

            completion = {
                menu = {
                    scrollbar = false,
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 0,
                },
            },
        },
        opts_extend = { "sources.default" }
    },
    {
        'saghen/blink.compat',
        -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
        version = '*',
        -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
        lazy = true,
        -- make sure to set opts so that lazy.nvim calls blink.compat's setup
        opts = {},
    },
}
