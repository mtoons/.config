return {
    {
        keys = {
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

            {
                '<leader>sh',
                require('telescope.builtin').help_tags,
                desc = '[S]earch [H]elp',
            },
            {
                '<leader>sk',
                function()
                    require('telescope.builtin').keymaps(require "telescope.themes".get_dropdown())
                end,
                desc = '[S]earch [K]eymaps',
            },
            {
                '<leader>sf',
                require('telescope.builtin').find_files,
                desc = '[S]earch [F]iles',
            },
            {
                '<leader>gf',
                require('telescope.builtin').git_files,
                desc = 'Search [G]it [F]iles',
            },
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
            {
                '<leader>sb',
                require('telescope.builtin').buffers,
                desc = '[S]earch [B]uffers',
            },
            {
                '<leader>sr',
                require('telescope.builtin').resume,
                desc = '[S]earch [R]esume',
            },
            {
                '<leader>so',
                require('telescope.builtin').oldfiles,
                desc = '[S]earch [O]ldfiles',
            },
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
                        theme = "ivy",
                    },
                    commands = {
                        theme = "dropdown",
                    },
                    tags = {
                        theme = "dropdown",
                    },
                    diagnostics = {
                        theme = "ivy",
                    },
                    keymaps = {
                        theme = "dropdown",
                    },
                    current_buffer_fuzzy_find = {
                        theme = "ivy",
                    },
                    find_files = {
                        theme = "ivy",
                    },
                    help_tags = {
                        theme = "ivy",
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_ivy {},
                    },
                    fzf = {},
                },
            }


            telescope.load_extension("ui-select")
            telescope.load_extension('fzf')
        end,
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
            },
            { 'nvim-telescope/telescope-ui-select.nvim' },
            { 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
        },
    },
}
