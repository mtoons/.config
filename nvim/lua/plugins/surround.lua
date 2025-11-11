return {
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        opts = {
            keymaps = {
                normal = "s",
                normal_cur = "ss",
                normal_line = "S",
                normal_cur_line = "SS",
            },
            aliases = {
                ["b"] = ")",
                ["B"] = "}",
                ["r"] = "]",
                ["q"] = { '"', "'", "`" },
                ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
                ["d"] = "$",
            },
        },
    },
}
