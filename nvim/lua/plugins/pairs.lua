return {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true,
        opts = {},
        init = function()
            local Rule = require('nvim-autopairs.rule')
            local npairs = require('nvim-autopairs')

            local cond = require('nvim-autopairs.conds')

            npairs.add_rules({
                Rule("$", "$", { "typ", "typst" }),
                Rule(" ", " ", { "typ", "typst" }):with_pair(cond.after_text("$")),
            })
        end
    },
}
