if not vim.g.neovide then
    return {
        {
            "sphamba/smear-cursor.nvim",
            opts = {
                legacy_computing_symbols_support = true,
            },
        },
    }
else
    return {}
end
