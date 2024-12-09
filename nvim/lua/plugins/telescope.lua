return {
    {
        keys = {
            -- {
            --     "<leader>-",
            --     "<cmd>Yazi<cr>",
            --     desc = "Open yazi at the current file",
            -- },
            {
                '<leader>?',
                require('telescope.builtin').oldfiles,
                desc = '[?] Find recently opened files',
            },
            {
                '<leader>/',
                require('telescope.builtin').current_buffer_fuzzy_find,
                desc = '[/] Fuzzily search in current buffer',
            },

            { '<leader>sh', require('telescope.builtin').help_tags,  desc = '[S]earch [H]elp', },
            {
                '<leader>sk',
                function() require('telescope.builtin').keymaps(require "telescope.themes".get_dropdown()) end,
                desc = '[S]earch [K]eymaps',
            },
            { '<leader>sf', require('telescope.builtin').find_files, desc = '[S]earch [F]iles', },
            { '<leader>gf', require('telescope.builtin').git_files,  desc = 'Search [G]it [F]iles', },
            {
                '<leader>sw',
                require('telescope.builtin').grep_string,
                desc = '[S]earch current [W]ord',
            },
            { '<leader>sg', require('telescope.builtin').live_grep, desc = '[S]earch by [G]rep', },
            {
                '<leader>sd',
                require('telescope.builtin').diagnostics,
                desc = '[S]earch [D]iagnostics',
            },
            { '<leader>sb', require('telescope.builtin').buffers,   desc = '[S]earch [B]uffers', },
            { '<leader>sr', require('telescope.builtin').resume,    desc = '[S]earch [R]esume', },
            { '<leader>so', require('telescope.builtin').oldfiles,  desc = '[S]earch [O]ldfiles', },
        },
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        config = function()
            local telescope = require 'telescope'
            telescope.setup {
                defaults = {
                    file_ignore_patterns = {
                        "node_modules", "build/", "dist", "yarn.lock", "%.odt", "%.pdf"
                    },
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
                    diagnostics = {
                        theme = "dropdown",
                    },
                    keymaps = {
                        theme = "dropdown",
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_ivy {},
                    },
                },
            }

            pcall(telescope.load_extension, 'fzf')
            telescope.load_extension("ui-select")

            -- vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles,
            --     { desc = '[?] Find recently opened files' })
            -- vim.keymap.set('n', '<leader>/', require('telescope.builtin').current_buffer_fuzzy_find,
            --     { desc = '[/] Fuzzily search in current buffer' })
            --
            -- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
            -- vim.keymap.set('n', '<leader>sk',
            --     function() require('telescope.builtin').keymaps(require "telescope.themes".get_dropdown()) end,
            --     { desc = '[S]earch [K]eymaps' })
            -- vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
            -- vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
            -- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string,
            --     { desc = '[S]earch current [W]ord' })
            -- vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
            -- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics,
            --     { desc = '[S]earch [D]iagnostics' })
            -- vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[S]earch [B]uffers' })
            -- vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
            -- vim.keymap.set('n', '<leader>so', require('telescope.builtin').oldfiles, { desc = '[S]earch [O]ldfiles' })
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
