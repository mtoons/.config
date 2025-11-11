return {
    {
        'abecodes/tabout.nvim',
        lazy = false,
        config = function()
            require('tabout').setup {
                tabkey = '<Tab>',
                backwards_tabkey = '',
                act_as_tab = true,
                act_as_shift_tab = false,
                default_tab = '<C-t>',
                default_shift_tab = '<C-d>',
                enable_backwards = true,
                completion = false,
                tabouts = {
                    { open = "'", close = "'" },
                    { open = '"', close = '"' },
                    { open = '`', close = '`' },
                    { open = '(', close = ')' },
                    { open = '[', close = ']' },
                    { open = '{', close = '}' },
                    { open = '$', close = '$' },
                },
                ignore_beginning = true,
                exclude = {}
            }
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        opt = true,
        event = 'InsertCharPre',
    },
}
