return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        main = "nvim-treesitter.configs",
        opts = {
            textobjects = {
                select = {
                    enable = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["ab"] = "@block.outer",
                        ["ib"] = "@block.inner",
                    },
                },
            },
            ensure_installed = {
                "markdown",
                "markdown_inline",
            },
            -- Autoinstall languages that are not installed
            auto_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
        },
        dependencies = {
            { "nvim-treesitter/nvim-treesitter-textobjects" },

            -- NOTE: additional parsers
            { "nushell/tree-sitter-nu" },
        },
    },
}
