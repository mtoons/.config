return {
    {
        "OXY2DEV/markview.nvim",
        -- lazy = false, -- Recommended
        ft = { "markdown" }, -- If you decide to lazy-load anyway

        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "echasnovski/mini.nvim"
        },
        opts = {
            preview = {
                -- hybrid_modes = { "n", "no", "c", "i" },
            },
        },
    },
    -- {
    --     'MeanderingProgrammer/render-markdown.nvim',
    --     dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    --     -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    --     ---@module 'render-markdown'
    --     ---@type render.md.UserConfig
    --     opts = {},
    -- },
}
