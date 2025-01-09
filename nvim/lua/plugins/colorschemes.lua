return {
    {
        'catppuccin/nvim',
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                background = {     -- :h background
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = not vim.g.neovide, -- disables setting the background color.
                show_end_of_buffer = false,                 -- shows the '~' characters after the end of buffers
                term_colors = true,                         -- sets terminal colors (e.g. `g:terminal_color_0`)
                dim_inactive = {
                    enabled = true,                         -- dims the background color of inactive window
                    shade = "dark",
                    percentage = 0.15,                      -- percentage of the shade to apply to the inactive window
                },
                no_italic = false,                          -- Force no italic
                no_bold = false,                            -- Force no bold
                no_underline = false,                       -- Force no underline
                styles = {                                  -- Handles the styles of general hi groups (see `:h highlight-args`):
                    comments = { "italic" },                -- Change the style of comments
                    conditionals = { "italic" },
                    loops = {},
                    functions = {},
                    keywords = { "bold" },
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = { "bold" },
                    properties = {},
                    types = { "bold" },
                    operators = { "bold" },
                    -- miscs = {}, -- Uncomment to turn off hard-coded styles
                },
                color_overrides = {},
                custom_highlights = {},
                default_integrations = true,
                integrations = {
                    dashboard = false,
                    cmp = true,
                    gitsigns = true,
                    nvimtree = false,
                    treesitter = true,
                    notify = false,
                    which_key = true,
                    mason = false,
                    notifier = false,
                    fidget = false,
                    markdown = true,
                    render_markdown = false,
                    mini = {
                        enabled = false,
                        indentscope_color = "",
                    },
                    -- telescope = {
                    --     enabled = true,
                    --     style = "classic"
                    -- },
                    fzf = true,
                    snacks = true,
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = { "italic" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                            ok = { "italic" },
                        },
                        underlines = {
                            errors = { "undercurl" },
                            hints = { "underline" },
                            warnings = { "underline" },
                            information = { "underline" },
                            ok = { "underline" },
                        },
                        inlay_hints = {
                            background = false,
                        },
                    },
                },
            })

            -- setup must be called before loading
            vim.cmd.colorscheme "catppuccin"
        end,
    },
}
