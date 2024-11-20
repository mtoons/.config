return {
    {
        "olimorris/persisted.nvim",
        lazy = false, -- make sure the plugin is always loaded at startup
        config = true,
        dependencies = {
            "nvim-telescope/telescope.nvim"
        },
        init = function()
            require("telescope").load_extension("persisted")
            vim.keymap.set('n', '<leader>ss', ":Telescope persisted theme=dropdown<CR>",
                { desc = '[S]earch [S]essions', silent = true, })
        end,
        -- keys = {
        -- }
    }
}
