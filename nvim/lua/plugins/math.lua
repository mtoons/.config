return {
    -- {
    --     lazy = true,
    --     "iamcco/markdown-preview.nvim",
    --     cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    --     build = "cd app && yarn install",
    --     init = function()
    --         vim.g.mkdp_filetypes = { "markdown", "latex", "tex", "plaintex" }
    --     end,
    --     ft = { "markdown", "latex", "tex", "plaintex" },
    -- },
    {
        "lervag/vimtex",
        lazy = false, -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
            -- VimTeX configuration goes here, e.g.
            -- vim.g.vimtex_view_general_viewer = 'SumatraPDF'
            -- vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
            vim.g.tex_flavor = "latex"
            vim.cmd "set conceallevel=1"
            -- vim.g.tex_conceal = "abdmg"
            vim.g.vimtex_syntax_conceal = {
                accents = 1,
                ligatures = 1,
                cites = 1,
                fancy = 1,
                spacing = 1,
                greek = 1,
                math_bounds = 1,
                math_delimiters = 1,
                math_fracs = 1,
                math_super_sub = 1,
                math_symbols = 1,
                sections = 1,
                styles = 1,
            }
            vim.g.vimtex_compiler_method = 'latexmk'
        end
    }
}
