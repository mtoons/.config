return {
    { -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        main = "nvim-treesitter.configs", -- Sets main module to use for opts
        -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
        opts = {
            ensure_installed = {
                -- "bash",
                -- "c",
                -- "diff",
                -- "html",
                -- "lua",
                -- "luadoc",
                "markdown",
                "markdown_inline",
                -- "query",
                -- "vim",
                -- "vimdoc",
            },
            -- Autoinstall languages that are not installed
            auto_install = false,
            highlight = {
                enable = true,
                -- disable = { "latex" },
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
        },
        dependencies = {
            -- NOTE: additional parser
            { "nushell/tree-sitter-nu" },
        },
        -- There are additional nvim-treesitter modules that you can use to interact
        -- with nvim-treesitter. You should go explore a few and see what interests you:
        --
        --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
        --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
        --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    },
}
