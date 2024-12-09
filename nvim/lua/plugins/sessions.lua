return {
    {
        keys = {
            {
                '<leader>ss',
                ":Telescope persisted theme=dropdown<CR>",
                desc = '[S]earch [S]essions',
            },
            {
                '<leader>Ss',
                ":SessionStart<CR>",
                desc = '[S]essions [S]tart',
            },
            {
                '<leader>Sb',
                ":SessionStop<CR>",
                desc = '[S]essions [B]reak',
            },
            {
                '<leader>Sw',
                ":SessionSave<CR>",
                desc = '[S]essions [W]rite',
            },
            {
                '<leader>Sl',
                ":SessionLoad<CR>",
                desc = '[S]essions [L]oad',
            },
            {
                '<leader>Sd',
                ":SessionDelete<CR>",
                desc = '[S]essions [D]elete',
            },
        },
        "olimorris/persisted.nvim",
        -- lazy = true, -- make sure the plugin is always loaded at startup
        -- config = true,
        opts = {
            autostart = false,
        },
        dependencies = {
            "nvim-telescope/telescope.nvim"
        },
        init = function()
            require("telescope").load_extension("persisted")
            -- vim.keymap.set('n', '<leader>ss', ":Telescope persisted theme=dropdown<CR>",
            --     { desc = '[S]earch [S]essions', })
            -- vim.keymap.set('n', '<leader>Ss', ":SessionStart<CR>",
            --     { desc = '[S]essions [S]tart', })
            -- vim.keymap.set('n', '<leader>Sb', ":SessionStop<CR>",
            --     { desc = '[S]essions [B]reak', })
            -- vim.keymap.set('n', '<leader>Sw', ":SessionSave<CR>",
            --     { desc = '[S]essions [W]rite', })
            -- vim.keymap.set('n', '<leader>Sl', ":SessionLoad<CR>",
            --     { desc = '[S]essions [L]oad', })
            -- vim.keymap.set('n', '<leader>Sd', ":SessionDelete<CR>",
            --     { desc = '[S]essions [D]elete', })
        end,
        -- keys = {
        -- },
    }
}
