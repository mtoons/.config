return {
 {
        "benlubas/molten-nvim",
        lazy = true,
        event = "BufEnter *.ipynb",
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        dependencies = { "willothy/wezterm.nvim" },
        build = ":UpdateRemotePlugins",
        init = function()
            -- these are examples, not defaults. Please see the readme
            vim.g.molten_output_win_max_height = 20
            vim.g.molten_auto_open_output = false -- cannot be true if molten_image_provider = "wezterm"
            vim.g.molten_output_show_more = true
            vim.g.molten_image_provider = "wezterm"
            vim.g.molten_output_virt_lines = true
            vim.g.molten_split_direction = "right" --direction of the output window, options are "right", "left", "top", "bottom"
            vim.g.molten_split_size = 40 --(0-100) % size of the screen dedicated to the output window
            vim.g.molten_virt_text_output = true
            vim.g.molten_use_border_highlights = true
            vim.g.molten_virt_lines_off_by_1 = true
            vim.g.molten_auto_image_popup = false
        end,
    },
}
