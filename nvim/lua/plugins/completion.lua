return {
    {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        dependencies = { "rafamadriz/friendly-snippets", "nvim-treesitter/nvim-treesitter" },
        opts = {
            enable_autosnippets = true,
        },
        config = function(_, opts)
            ---@diagnostic disable: unused-local
            ---@type LuaSnip
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
            local fmt = require("luasnip.extras.fmt").fmta
            local types = require("luasnip.util.types")
            local conds = require("luasnip.extras.conditions")
            local conds_expand = require("luasnip.extras.conditions.expand").snippet

            -- Maybe ask on neovim subreddit which really is the fastest
            ---@return boolean # Is the cursor in a math block.
            local function in_math()
                -- local ts = vim.treesitter
                -- local cur_node = ts.get_node()
                -- if not cur_node then return false end
                --
                -- ---@type TSNode|nil
                -- local node = cur_node:tree():root()
                -- while node do
                --     if node:type() == "math" then return true end
                --     node = node:child_with_descendant(cur_node)
                -- end
                -- return false
                -- is_ancestor()

                local ts = vim.treesitter

                local cur_node = ts.get_node()
                if not cur_node then return false end
                if cur_node:type() == "math" then return true end
                local root = cur_node:tree():root()

                local query = ts.query.parse("typst", "(math) @math")
                for _, node in query:iter_captures(root, 0) do
                    if ts.is_ancestor(node, cur_node) then return true end
                end

                return false
            end

            ls.add_snippets("typst", {
                s("récurrence", fmt([[
                #recurrence(
                  $ <> $,
                  $ <> $,
                  $ <> $,
                  $
                    <>
                  $,
                )
                ]],
                    {
                        i(1, "NN"),
                        i(2, "\"proposition\""),
                        i(3, "\"initialisation\""),
                        i(0, "\"récurrence\""),
                    }
                )),
                s({ trig = "hhl", snippetType = "autosnippet", hidden = true }, fmt("#high[<>]", { i(0) })),
                s({ trig = "uul", snippetType = "autosnippet", hidden = true }, fmt("#und[<>]", { i(0) })),
                s({ trig = "tta", snippetType = "autosnippet", hidden = true }, fmt('#tab[<>]', { i(0) })),
                s(
                    { trig = "ff", snippetType = "autosnippet", hidden = true },
                    fmt("(<>)/(<>)", { i(1), i(0) }),
                    { condition = in_math }
                ),
                s(
                    { trig = "lin", snippetType = "autosnippet", hidden = true },
                    fmt("lim_(n->>+oo) ", {}),
                    { condition = in_math }
                ),
                s(
                    { trig = "lix", snippetType = "autosnippet", hidden = true },
                    fmt("lim_(x->><>) <>", { i(1, "+oo"), i(0) }),
                    { condition = in_math }
                ),
                s(
                    { trig = " (%u)(%u)v", regTrig = true, wordTrig = false, snippetType = "autosnippet", hidden = true },
                    {
                        t(" va("),
                        l(l.CAPTURE1),
                        t(" "),
                        l(l.CAPTURE2),
                        t(")"),
                    },
                    { condition = in_math }
                ),
                s(
                    { trig = " ([%a0])v", regTrig = true, wordTrig = false, snippetType = "autosnippet", hidden = true },
                    {
                        t(" va("),
                        l(l.CAPTURE1),
                        t(")")
                    },
                    { condition = in_math }
                ),
                s({ trig = "mt", snippetType = "autosnippet", hidden = true }, fmt("$<>$", { i(0) })),
                s({ trig = "mmt", snippetType = "autosnippet", hidden = true }, fmt("$ <> $", { i(0) })),
            }, {}
            )
            require "luasnip.loaders.from_vscode".lazy_load()
        end
    },
    {
        'saghen/blink.cmp',
        dependencies = {
            'hrsh7th/cmp-calc',
            'folke/lazydev.nvim',
            'rafamadriz/friendly-snippets',
        },
        version = '*',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            cmdline = {
                keymap = { preset = 'inherit' },
                completion = { menu = { auto_show = true, }, },
            },
            keymap = {
                preset = 'default',
                ['<C-space>'] = { 'select_and_accept', 'fallback' },
                ['<C-y>'] = { 'show', 'show_documentation', 'hide_documentation' },
            },

            appearance = {
                nerd_font_variant = 'normal'
            },

            snippets = { preset = 'luasnip' },
            sources = {
                default = { 'snippets', 'lazydev', 'lsp', 'path', 'calc' },

                providers = {
                    calc = {
                        name = 'calc',
                        module = 'blink.compat.source',
                    },
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
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
        version = '*',
        lazy = true,
        opts = {},
    },
}
