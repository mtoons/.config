return {
    {
        ft = "ipynb",
        'Vigemus/iron.nvim',
        config = function()
            local iron = require("iron.core")

            iron.setup {
                config = {
                    -- Whether a repl should be discarded or not
                    scratch_repl = true,
                    -- Your repl definitions come here
                    repl_definition = {
                        sh = {
                            -- Can be a table or a function that
                            -- returns a table (see below)
                            command = { "sh" }
                        },
                        python = {
                            -- command = { "wsl", "python3" }, -- or { "python3", "ipython", "--no-autoindent" }
                            command = { "pwsh", "-Command", "python3" },
                            format = require("iron.fts.common").bracketed_paste_python
                        },
                        markdown = {
                            -- command = { "wsl", "python3" }, -- or { "python3", "ipython", "--no-autoindent" }
                            command = { "pwsh", "-Command", "python3" },
                            format = require("iron.fts.common").bracketed_paste_python
                        },
                    },
                    -- How the repl window will be displayed
                    -- See below for more information
                    repl_open_cmd = require("iron.view").split.vertical.botright("40%", {
                        winfixwidth = false,
                        winfixheight = false,
                        -- any window-local configuration can be used here
                        number = false
                    })
                },
                -- Iron doesn't set keymaps by default anymore.
                -- You can set them here or manually add keymaps to the functions in iron.core
                keymaps = {
                    send_motion = "<space>ic",
                    visual_send = "<space>ic",
                    send_file = "<space>if",
                    send_line = "<space>il",
                    send_paragraph = "<space>ip",
                    send_until_cursor = "<space>iu",
                    cr = "<space>i<cr>",
                    interrupt = "<space>i<space>",
                    exit = "<space>iq",
                    clear = "<space>iC",
                },
                -- If the highlight is on, you can change how it looks
                -- For the available options, check nvim_set_hl
                highlight = {
                    italic = true
                },
                ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
            }

            -- iron also has a list of commands, see :h iron-commands for all available commands
            vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
            vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
            vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
            vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')
        end,
    },
    {
        ft = "ipynb",
        "GCBallesteros/jupytext.nvim",
        -- config = true,
        -- Depending on your nvim distro or config you may need to make the loading not lazy
        -- lazy=false,
        opts = {
            style = "hydrogen",
            output_extension = "auto", -- Default extension. Don't change unless you know what you are doing
            force_ft = nil,            -- Default filetype. Don't change unless you know what you are doing
            custom_language_formatting = {
                python = {
                    extension = "md",
                    style = "markdown",
                    force_ft = "markdown", -- you can set whatever filetype you want here
                },
            }
        },
    },
}
