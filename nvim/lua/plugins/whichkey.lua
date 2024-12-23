return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "modern",
        },
        init = function()
            local wk = require 'which-key'
            wk.add({
                '<leader>c',
                desc = '[C]heck',
                icon = '',
            })
            wk.add({
                '<leader>t',
                desc = '[T]oggle',
                icon = '⏼',
            })
            wk.add({
                '<leader>s',
                desc = '[S]earch',
                icon = '',
            })
            wk.add({
                '<leader>d',
                icon = '',
            })
            wk.add({
                '<leader>S',
                desc = '[S]ession',
                icon = '󰦛',
            })
            wk.add({
                '<leader><space>',
                desc = 'alternate buffer',
                icon = '󰓢',
            })
        end
    }
}
