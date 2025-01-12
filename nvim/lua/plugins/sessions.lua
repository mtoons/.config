return {
    -- {
    --     "olimorris/persisted.nvim",
    --     enabled = Finder == "telescope",
    --     dependencies = {
    --         "nvim-telescope/telescope.nvim"
    --     },
    --     keys = {
    --         {
    --             '<leader>ss',
    --             "<cmd>Telescope persisted theme=dropdown<CR>",
    --             desc = '[S]earch [S]essions',
    --         },
    --         {
    --             '<leader>Ss',
    --             "<cmd>SessionStart<CR>",
    --             desc = '[S]essions [S]tart',
    --         },
    --         {
    --             '<leader>Sb',
    --             "<cmd>SessionStop<CR>",
    --             desc = '[S]essions [B]reak',
    --         },
    --         {
    --             '<leader>Sw',
    --             "<cmd>SessionSave<CR>",
    --             desc = '[S]essions [W]rite',
    --         },
    --         {
    --             '<leader>Sl',
    --             "<cmd>SessionLoad<CR>",
    --             desc = '[S]essions [L]oad',
    --         },
    --         {
    --             '<leader>Sd',
    --             "<cmd>SessionDelete<CR>",
    --             desc = '[S]essions [D]elete',
    --         },
    --     },
    --     -- lazy = true, -- make sure the plugin is always loaded at startup
    --     -- config = true,
    --     opts = {
    --         autostart = false,
    --     },
    --     init = function()
    --         require("telescope").load_extension("persisted")
    --         -- vim.keymap.set('n', '<leader>ss', ":Telescope persisted theme=dropdown<CR>",
    --         --     { desc = '[S]earch [S]essions', })
    --         -- vim.keymap.set('n', '<leader>Ss', ":SessionStart<CR>",
    --         --     { desc = '[S]essions [S]tart', })
    --         -- vim.keymap.set('n', '<leader>Sb', ":SessionStop<CR>",
    --         --     { desc = '[S]essions [B]reak', })
    --         -- vim.keymap.set('n', '<leader>Sw', ":SessionSave<CR>",
    --         --     { desc = '[S]essions [W]rite', })
    --         -- vim.keymap.set('n', '<leader>Sl', ":SessionLoad<CR>",
    --         --     { desc = '[S]essions [L]oad', })
    --         -- vim.keymap.set('n', '<leader>Sd', ":SessionDelete<CR>",
    --         --     { desc = '[S]essions [D]elete', })
    --     end,
    --     -- keys = {
    --     -- },
    -- },
    {
        "gennaro-tedesco/nvim-possession",
        enabled = true,
        dependencies = {
            "ibhagwan/fzf-lua",
        },
        opts = {
            autosave = false,
            winopts = {
                border = "none",
                preview = {
                    border = "none"
                },
                backdrop = 100
            },
            fzf_hls = { -- highlight groups for the sessions and preview windows
                normal = "Normal",
                preview_normal = "Normal",
                border = "none",
                preview_border = "none",
            },
        },
        init = function()
            local possession = require("nvim-possession")
            possession.setup({})
            vim.keymap.set("n", "<leader>ss", function()
                possession.list()
            end, { desc = "Search [Sessions]" })
            vim.keymap.set("n", "<leader>Sn", function()
                possession.new()
            end, { desc = "Session [N]ew" })
            vim.keymap.set("n", "<leader>Su", function()
                possession.update()
            end, { desc = "Session [U]pdate" })
            vim.keymap.set("n", "<leader>Sd", function()
                possession.delete()
            end, { desc = "Session [D]elete" })
        end,
    },
}
