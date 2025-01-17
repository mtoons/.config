return {
    {
        'echasnovski/mini.nvim',
        version = false,
        opts = {
            ai = {
                silent = true,
            },
            surround = {
                silent = true,
            },
            icons = {
                style = "glyph",
            },
        },
        config = function(_, opts)
            for module, config in pairs(opts) do
                require("mini." .. module).setup(config)
            end
        end,
    },
}
