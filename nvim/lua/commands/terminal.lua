local state = {
    floating = {
        buf = -1,
        win = -1,
    },
}
local function create_floating_window(opts)
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local win_config = {
        relative = "editor",
        width = width,
        height = height,
        col = math.floor((vim.o.columns - width) / 2),
        row = math.floor((vim.o.lines - height) / 2),
        style = "minimal",
        border = Border,
    }

    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end
    local win = vim.api.nvim_open_win(buf, true, win_config)
    return { buf = buf, win = win }
end
local function toggle_terminal()
    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = create_floating_window { buf = state.floating.buf }
        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd.term("nu")
        end
        vim.api.nvim_buf_set_keymap(
            state.floating.buf,
            "t",
            "<esc>",
            "<cmd>Floaterminal<CR>",
            {}
        )
        vim.cmd.startinsert()
    else
        vim.api.nvim_buf_del_keymap(state.floating.buf, "t", "<esc>")
        vim.api.nvim_win_hide(state.floating.win)
    end
end

vim.keymap.set({ 'n', 't', 'i' }, '<c-t>', toggle_terminal, {})

vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})

return {
    ToggleTerminal = toggle_terminal,
}
