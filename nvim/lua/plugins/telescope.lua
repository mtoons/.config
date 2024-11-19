return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        config = function()
            require('telescope').setup {
                defaults = {
                    mappings = {
                        i = {
                            ["<esc>"] = require("telescope.actions").close
                        },
                    },
                },
                pickers = {
                    default = {
                        theme = "dropdown",
                    },
                    buffers = {
                        theme = "dropdown",
                    },
                    oldfiles = {
                        theme = "dropdown",
                    },
                    commands = {
                        theme = "dropdown",
                    },
                    tags = {
                        theme = "dropdown",
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_ivy {},
                    },
                },
            }

            pcall(require('telescope').load_extension, 'fzf')
            require("telescope").load_extension("ui-select")

            vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles,
                { desc = '[?] Find recently opened files' })
            vim.keymap.set('n', '<leader>/', require('telescope.builtin').current_buffer_fuzzy_find,
                { desc = '[/] Fuzzily search in current buffer' })

            vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
            vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [K]eymaps' })
            vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
            vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
            vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string,
                { desc = '[S]earch current [W]ord' })
            vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
            vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics,
                { desc = '[S]earch [D]iagnostics' })
            vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[S]earch [B]uffers' })
            vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
            vim.keymap.set('n', '<leader>so', require('telescope.builtin').oldfiles, { desc = '[S]earch [O]ldfiles' })
        end,
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
            { 'nvim-telescope/telescope-ui-select.nvim' },
            { 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
        },
    },
}
