if Finder == "telescope" then
    return {
        {
            'nvim-telescope/telescope.nvim',
            branch = '0.1.x',
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
                    desc = 'Search [H]elp',
                },
                {
                    '<leader>sk',
                    function()
                        require('telescope.builtin').keymaps(require "telescope.themes".get_dropdown())
                    end,
                    desc = 'Search [K]eymaps',
                },
                {
                    '<leader>sf',
                    require('telescope.builtin').find_files,
                    desc = 'Search [F]iles',
                },
                {
                    '<leader>sw',
                    require('telescope.builtin').grep_string,
                    desc = 'Search current [W]ord',
                },
                { '<leader>sg', require('telescope.builtin').live_grep, desc = 'Search by [G]rep', },
                {
                    '<leader>sd',
                    require('telescope.builtin').diagnostics,
                    desc = 'Search [D]iagnostics',
                },
                {
                    '<leader>sb',
                    require('telescope.builtin').buffers,
                    desc = 'Search [B]uffers',
                },
                {
                    '<leader>sr',
                    require('telescope.builtin').resume,
                    desc = 'Search [R]esume',
                },
                {
                    '<leader>so',
                    require('telescope.builtin').oldfiles,
                    desc = 'Search [O]ldfiles',
                },
                {
                    '<leader>sp',
                    function()
                        require('telescope.builtin').find_files {
                            cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
                        }
                    end,
                    desc = 'Search [P]ackages',
                },
                {
                    '<leader>sc',
                    function()
                        require('telescope.builtin').find_files {
                            cwd = vim.fn.stdpath('config')
                        }
                    end,
                    desc = 'Search [P]onfigg',
                },
            },
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
elseif Finder == "fzf-lua" then
    return {
        {
            "ibhagwan/fzf-lua",
            dependencies = { "echasnovski/mini.icons" },
            cmd = "FzfLua",
            keys = {
                {
                    "<c-j>",
                    "<c-j>",
                    ft = "fzf",
                    mode =
                    "t",
                    nowait = true
                },
                {
                    "<c-k>",
                    "<c-k>",
                    ft = "fzf",
                    mode =
                    "t",
                    nowait = true
                },
                {
                    "<leader>sb",
                    "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>",
                    desc = ">Search [B]uffers"
                },
                { "<leader>sf", "<cmd>FzfLua files<cr>",                desc = "Search [F]iles" },
                { "<leader>sg", "<cmd>FzfLua grep<cr>",                 desc = "Search [G]rep" },
                { "<leader>sr", "<cmd>FzfLua oldfiles<cr>",             desc = "Search [R]ecent" },
                { '<leader>s"', "<cmd>FzfLua registers<cr>",            desc = "Search Registers" },
                { "<leader>sd", "<cmd>FzfLua diagnostics_document<cr>", desc = "Document Diagnostics" },
                { "<leader>sh", "<cmd>FzfLua help_tags<cr>",            desc = "Search [H]elp" },
                { "<leader>sk", "<cmd>FzfLua keymaps<cr>",              desc = "Search [K]eymaps" },
                { "<leader>sq", "<cmd>FzfLua quickfix<cr>",             desc = "Search [Q]uickfix" },
            },
        }
    }
end
