return {
    {
        "folke/snacks.nvim",
        dependencies = {
            { 'echasnovski/mini.icons', version = false, opts = {} },
        },
        priority     = 1000,
        lazy         = false,
        keys         = {
            { '<leader>e',   function() Snacks.explorer.open() end,       desc = "[E]xplorer" },
            { '<leader>se',  function() Snacks.picker.explorer() end,     desc = "Search [E]xplorer" },
            { '<leader>sb',  function() Snacks.picker.buffers() end,      desc = "Search [B]uffers" },
            { '<leader>ss',  function() Snacks.picker.colorschemes() end, desc = "Search [S]chemes" },
            { '<leader>s"',  function() Snacks.picker.registers() end,    desc = "Search [\"]Registers" },
            { '<leader>s\'', function() Snacks.picker.marks() end,        desc = "Search M']arks" },
            { '<leader>sg',  function() Snacks.picker.grep() end,         desc = "Search [G]rep" },
            { '<leader>sf',  function() Snacks.picker.files() end,        desc = "Search [F]iles" },
            { '<leader>sr',  function() Snacks.picker.recent() end,       desc = "Search [R]ecent" },
            { '<leader>sd',  function() Snacks.picker.diagnostics() end,  desc = "Search [D]iagnostics" },
            { '<leader>sh',  function() Snacks.picker.help() end,         desc = "Search [H]elp" },
            { '<leader>sk',  function() Snacks.picker.keymaps() end,      desc = "Search [K]eymaps" },
            { '<leader>sq',  function() Snacks.picker.qflist() end,       desc = "Search [Q]uickfix" },
            { '<leader>sp',  function() Snacks.picker.projects() end,     desc = "Search [P]ojects" },
            {
                '<leader>sc',
                function()
                    Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
                end,
                desc = "Search [C]onfig"
            },
            {
                '<leader>sl',
                function()
                    Snacks.picker.files({ cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") })
                end,
                desc = "Search [L]azy"
            },
            { '<leader>sz', function() Snacks.picker.zoxide() end, desc = "Search [Z]oxide" },

            { "<leader>z",  function() Snacks.zen() end,           desc = "Toggle Zen Mode" },
            {
                "<leader>nc",
                function() Snacks.notifier.hide() end,
                desc = "Notifications Close",
            },
            {
                "<leader>nh",
                function() Snacks.notifier.show_history() end,
                desc = "Notifications History",
            },
        },
        opts         = {
            explorer = {
                replace_netrw = true,
            },
            picker = {
                layouts = {
                    default = {
                        layout = {
                            box = "horizontal",
                            width = 0.8,
                            min_width = 120,
                            height = 0.8,
                            border = Border,
                            {
                                box = "vertical",
                                border = "none",
                                title = "{source} {live}",
                                title_pos = "center",
                                { win = "input", height = 1,     border = "none" },
                                { win = "list",  border = "none" },
                            },
                            { win = "preview", border = "left", width = 0.5 },
                        },
                    },
                    sidebar = {
                        layout = {
                            box = "horizontal",
                            width = 0.8,
                            min_width = 120,
                            height = 0.8,
                            border = Border,
                            {
                                box = "vertical",
                                border = "none",
                                title = "{source} {live}",
                                title_pos = "center",
                                { win = "input", height = 1,     border = "none" },
                                { win = "list",  border = "none" },
                            },
                            { win = "preview", border = "left", width = 0.5 },
                        },
                    },
                    dropdown = {
                        layout = {
                            backdrop = false,
                            row = 1,
                            width = 0.4,
                            min_width = 80,
                            height = 0.8,
                            border = Border,
                            box = "vertical",
                            { win = "preview", height = 0.4, border = "none" },
                            {
                                box = "vertical",
                                border = "none",
                                title = "{source} {live}",
                                title_pos = "center",
                                { win = "input", height = 1,     border = "none" },
                                { win = "list",  border = "none" },
                            },
                        },
                    },
                    select = {
                        preview = false,
                        layout = {
                            backdrop = false,
                            width = 0.5,
                            min_width = 80,
                            height = 0.4,
                            min_height = 10,
                            box = "vertical",
                            border = "none",
                            title = " Select ",
                            title_pos = "center",
                            { win = "input",   height = 1,     border = "none" },
                            { win = "list",    border = "none" },
                            { win = "preview", height = 0.4,   border = "top" },
                        },
                    },
                    telescope = {
                        reverse = true,
                        layout = {
                            box = "horizontal",
                            backdrop = false,
                            width = 0.8,
                            height = 0.9,
                            border = Border,
                            {
                                box = "vertical",
                                { win = "list",  title = " Results ", title_pos = "center", border = "none" },
                                { win = "input", height = 1,          border = "rounded",   title = "{source} {live}", title_pos = "center" },
                            },
                            {
                                win = "preview",
                                width = 0.45,
                                border = "left",
                                title = " Preview ",
                                title_pos = "center",
                            },
                        },
                    },
                    vertical = {
                        layout = {
                            backdrop = false,
                            width = 0.5,
                            min_width = 80,
                            height = 0.8,
                            min_height = 30,
                            box = "vertical",
                            border = Border,
                            title = "{source} {live}",
                            title_pos = "center",
                            { win = "input",   height = 1,     border = "none" },
                            { win = "list",    border = "none" },
                            { win = "preview", height = 0.4,   border = "top" },
                        },
                    },
                    vscode = {
                        preview = false,
                        layout = {
                            backdrop = false,
                            row = 1,
                            width = 0.4,
                            min_width = 80,
                            height = 0.4,
                            border = "none",
                            box = "vertical",
                            { win = "input",   height = 1,     border = "rounded", title = "{source} {live}", title_pos = "center" },
                            { win = "list",    border = "hpad" },
                            { win = "preview", border = "none" },
                        },
                    },
                },
                sources = {
                    explorer = {
                        finder = "explorer",
                        sort = { fields = { "sort" } },
                        tree = true,
                        supports_live = true,
                        follow_file = true,
                        focus = "input",
                        auto_close = true,
                        jump = { close = false },
                        layout = { preset = "default", preview = false },
                        formatters = { file = { filename_only = true } },
                        matcher = { sort_empty = true },
                        config = function(opts)
                            return require("snacks.picker.source.explorer").setup(opts)
                        end,
                        win = {
                            input = {
                                keys = {
                                    ["<C-a>"] = { "explorer_add", mode = { "n", "i" } },
                                    ["<C-d>"] = { "explorer_del", mode = { "n", "i" } },
                                    ["<C-m>"] = { "explorer_move", mode = { "n", "i" } },
                                },
                            },
                            list = {
                                keys = {
                                    ["<BS>"] = "explorer_up",
                                    ["a"] = "explorer_add",
                                    ["d"] = "explorer_del",
                                    ["r"] = "explorer_rename",
                                    ["c"] = "explorer_copy",
                                    ["m"] = "explorer_move",
                                    ["y"] = "explorer_yank",
                                    ["<c-c>"] = "explorer_cd",
                                    ["."] = "explorer_focus",
                                },
                            },
                        },
                    },
                },
                win = {
                    input = {
                        keys = {
                            ["<Esc>"] = { "close", mode = { "n", "i" } },
                        },
                    },
                },
            },
            zen = {

            },
            indent = {
                indent = {
                    enabled = false,
                    only_scope = true,
                    only_current = true,
                },
                scope = {
                    only_current = true,
                },
                animate = {
                    enabled = false,
                },
            },
            scroll = {
                enabled = not vim.g.neovide,
                animate = {
                    easing = "outCirc",
                },
            },
            statuscolumn = {
                enabled = true,
                folds = {
                    open = true,    -- show open fold icons
                    git_hl = false, -- use Git Signs hl for fold icons
                },
            },
            dashboard = {
                enabled = true,
                width = 60,
                row = nil,
                col = nil,
                pane_gap = 4,
                -- autokey sequence
                autokeys = "abdehijkmoptuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
                -- These settings are used by some built-in sections
                preset = {
                    -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
                    ---@type fun(cmd:string, opts:table)|nil
                    pick = nil,
                    -- Used by the `keys` section to show keymaps.
                    -- Set your curstom keymaps here.
                    -- When using a function, the `items` argument are the default keymaps.
                    ---@type snacks.dashboard.Item[]
                    keys = {
                        { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                        {
                            icon = " ",
                            key = "g",
                            desc = "Find Text",
                            action = ":lua Snacks.dashboard.pick('live_grep')"
                        },
                        {
                            icon = " ",
                            key = "r",
                            desc = "Recent Files",
                            action = ":lua Snacks.dashboard.pick('oldfiles')"
                        },
                        {
                            icon = " ",
                            key = "c",
                            desc = "Config",
                            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})"
                        },
                        {
                            icon = " ",
                            key = "s",
                            desc = "Restore Session",
                            action =
                                function()
                                    -- if Finder == "telescope" then
                                    --     require "persisted".select()
                                    -- elseif Finder == "fzf-lua" then
                                    Snacks.picker.zoxide()
                                    -- end
                                end,
                        },
                        {
                            icon = "󰒲 ",
                            key = "l",
                            desc = "Lazy",
                            action = ":Lazy",
                            enabled = package.loaded.lazy ~= nil
                        },
                        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                    },
                    -- Used by the `header` section
                    header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
                },
                sections = {
                    { section = "header", hl = "icon" },
                    { section = "keys",   gap = 1,    padding = 1 },
                    { section = "startup" },
                    {
                        pane = 2,
                        icon = " ",
                        title = "Recent Files",
                        section = "recent_files",
                        indent = 2,
                        padding = 1,
                        limit = 20
                    },
                },
            },
            ---@class snacks.notifier.Config
            ---@field filter? fun(notif: snacks.notifier.Notif): boolean # filter our unwanted notifications (return false to hide)
            notifier = {
                timeout = 1000,
                style = "compact",
                ---
                filter = function(notif)
                    return notif.msg ~= "tabout.nvim: No parser found for filetype "
                end
            },
            styles = {
                notification = {
                    border = Border,
                    zindex = 100,
                    ft = "markdown",
                    wo = {
                        winblend = 5,
                        wrap = false,
                        conceallevel = 2,
                        colorcolumn = "",
                    },
                    bo = { filetype = "snacks_notif" },
                },
                notification_history = {
                    border = Border,
                    zindex = 100,
                    width = 0.6,
                    height = 0.6,
                    minimal = false,
                    title = " Notification History ",
                    title_pos = "center",
                    ft = "markdown",
                    bo = { filetype = "snacks_notif_history", modifiable = false },
                    wo = { winhighlight = "Normal:SnacksNotifierHistory" },
                    keys = { q = "close" },
                },
                input = {
                    backdrop = false,
                    position = "float",
                    border = Border,
                    title_pos = "center",
                    height = 1,
                    width = 60,
                    relative = "editor",
                    noautocmd = true,
                    row = 2,
                    -- relative = "cursor",
                    -- row = -3,
                    -- col = 0,
                    wo = {
                        winhighlight =
                        "NormalFloat:SnacksInputNormal,FloatBorder:SnacksInputBorder,FloatTitle:SnacksInputTitle",
                        cursorline = false,
                    },
                    bo = {
                        filetype = "snacks_input",
                        buftype = "prompt",
                    },
                    --- buffer local variables
                    b = {
                        completion = false, -- disable blink completions in input
                    },
                    keys = {
                        n_esc = { "<esc>", { "cmp_close", "cancel" }, mode = "n", expr = true },
                        i_esc = { "<esc>", { "cmp_close", "stopinsert" }, mode = "i", expr = true },
                        i_cr = { "<cr>", { "cmp_accept", "confirm" }, mode = "i", expr = true },
                        i_tab = { "<tab>", { "cmp_select_next", "cmp" }, mode = "i", expr = true },
                        i_ctrl_w = { "<c-w>", "<c-s-w>", mode = "i", expr = true },
                        i_up = { "<up>", { "hist_up" }, mode = { "i", "n" } },
                        i_down = { "<down>", { "hist_down" }, mode = { "i", "n" } },
                        q = "cancel",
                    },
                },
                scratch = {
                    width = 100,
                    height = 30,
                    bo = { buftype = "", buflisted = false, bufhidden = "hide", swapfile = false },
                    minimal = false,
                    noautocmd = false,
                    -- position = "right",
                    zindex = 20,
                    wo = { winhighlight = "NormalFloat:Normal" },
                    border = Border,
                    title_pos = "center",
                    footer_pos = "center",
                },
                blame_line = {
                    width = 0.6,
                    height = 0.6,
                    border = Border,
                    title = " Git Blame ",
                    title_pos = "center",
                    ft = "git",
                },
            },
            bigfile = { enabled = true },
            quickfile = { enabled = true },
            terminal = {
                enabled = false,
                win = { style = "float" },
            },
            input = { enabled = true },

            bufdelete = { enabled = false },
            git = { enabled = false },
            gitbrowse = { enabled = false },
            lazygit = { enabled = false },
            rename = { enabled = false },
            win = { enabled = false },
            words = { enabled = false },
            scratch = { enabled = false },
        },
        init         = function()
            -- Lsp loading for snacks notifier
            vim.api.nvim_create_autocmd("LspProgress", {
                ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
                callback = function(ev)
                    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
                    vim.notify(vim.lsp.status(), "info", {
                        id = "lsp_progress",
                        title = "LSP Progress",
                        opts = function(notif)
                            notif.icon = ev.data.params.value.kind == "end" and " "
                                or spinner
                                [math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
                        end,
                    })
                end,
            })
            local snacks = require "snacks"
            vim.api.nvim_create_autocmd("User", {
                pattern = "VeryLazy",
                callback = function()
                    -- Setup some globals for debugging (lazy-loaded)
                    _G.dd = function(...)
                        snacks.debug.inspect(...)
                    end
                    _G.bt = function()
                        snacks.debug.backtrace()
                    end
                    vim.print = _G.dd -- Override print to use snacks for `:=` command

                    -- Create some toggle mappings
                    snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>ct")
                    snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>tw")
                    snacks.toggle.option("relativenumber", { name = "Relative Number" }):map(
                        "<leader>tL")
                    snacks.toggle.diagnostics():map("<leader>td")
                    snacks.toggle.line_number():map("<leader>tl")
                    snacks.toggle.option("conceallevel",
                        { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
                        :map("<leader>tc")
                    snacks.toggle.treesitter():map("<leader>tT")
                    snacks.toggle.inlay_hints():map("<leader>th")
                    snacks.toggle.scroll():map("<leader>ts")
                    snacks.toggle.indent():map("<leader>ti")
                    snacks.toggle.dim():map("<leader>tD")
                    -- snacks.toggle.profiler():map("<leader>tp")
                end,
            })
        end,
    },
}
