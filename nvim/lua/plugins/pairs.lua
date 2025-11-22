return {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true,
        opts = {},
        init = function()
            local Rule = require('nvim-autopairs.rule')
            local npairs = require('nvim-autopairs')

            npairs.add_rules({
                Rule("$", "$", { "typ", "typst" }),
            })
        end
    },
}
