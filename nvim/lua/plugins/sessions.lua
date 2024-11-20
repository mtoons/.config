return {
    {
        "olimorris/persisted.nvim",
        lazy = false, -- make sure the plugin is always loaded at startup
        config = true,
        opts = {
            autostart = false,
        },
        dependencies = {
            "nvim-telescope/telescope.nvim"
        },
        init = function()
            require("telescope").load_extension("persisted")
            vim.keymap.set('n', '<leader>ss', ":Telescope persisted theme=dropdown<CR>",
                { desc = '[S]earch [S]essions', silent = true, })
            vim.keymap.set('n', '<leader>Ss', ":SessionStart<CR>",
                { desc = '[S]essions [S]tart', silent = true, })
            vim.keymap.set('n', '<leader>Sb', ":SessionStop<CR>",
                { desc = '[S]essions [B]reak', silent = true, })
            vim.keymap.set('n', '<leader>Sl', ":SessionLoad<CR>",
                { desc = '[S]essions [L]oad', silent = true, })
            vim.keymap.set('n', '<leader>Sd', ":SessionDelete<CR>",
                { desc = '[S]essions [D]elete', silent = true, })
        end,
        -- keys = {
        -- },
    }
}
