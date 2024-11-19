vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Install `lazy.nvim` plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then ---@diagnostic disable-line: undefined-field
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { import = "plugins" },
}, {})

-- Keymaps
-- Silent leader
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Spellcheck
vim.keymap.set("n", "<leader>cf", ":setlocal spell spelllang=fr<CR>",
    { silent = true, desc = "[C]heck [F]rench spelling" })
vim.keymap.set("n", "<leader>ce", ":setlocal spell spelllang=en<CR>",
    { silent = true, desc = "[C]heck [E]nglish spelling" })
vim.keymap.set("n", "<leader>cs", ":setlocal spell spelllang=es<CR>",
    { silent = true, desc = "[C]heck [S]panish spelling" })

-- Clear highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Alternate file
vim.keymap.set("n", "<leader><space>", "<C-^>")

-- Diagnostic
vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float({}) end, { desc = "[D]iagnostics", silent = true })

-- Keep cursor in view
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>") -- Escape
vim.keymap.set("t", "<C-v>", function()
    return '<C-\\><C-N>"+pi'
end, { expr = true })
vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>")

-- Windows
vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h")
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k")
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l")
vim.keymap.set("i", "<C-h>", "<C-\\><C-N><C-w>h")
vim.keymap.set("i", "<C-j>", "<C-\\><C-N><C-w>j")
vim.keymap.set("i", "<C-k>", "<C-\\><C-N><C-w>k")
vim.keymap.set("i", "<C-l>", "<C-\\><C-N><C-w>l")

-- Settings
-- Highlight on search
vim.o.hlsearch = true

-- Diagnostics
vim.diagnostic.config {
    virtual_text = {
        prefix = "",
        spacing = 0,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = ' ',
            [vim.diagnostic.severity.WARN] = ' ',
            [vim.diagnostic.severity.HINT] = ' ',
            [vim.diagnostic.severity.INFO] = ' ',
        },
    },
}

-- Folds
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldlevelstart = 99

-- Nerd font
vim.g.have_nerd_font = true

-- Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Mouse
vim.o.mouse = "a"

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = "unnamedplus"

vim.o.showmode = false

-- Break indent
vim.o.breakindent = true

-- Undo history
vim.o.undofile = true

-- Case-insensitive searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Show whitespace
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"
vim.o.expandtab = true   -- expand tab input with spaces characters
vim.o.smartindent = true -- syntax aware indentations for newline inserts
vim.o.tabstop = 4        -- num of space characters per tab
vim.o.shiftwidth = 4     -- spaces per indentation level
vim.o.softtabstop = 4

-- True colors
vim.o.termguicolors = true

-- Gui
vim.g.gui_font_face = "VictorMono Nerd Font"
vim.g.gui_font_default_size = 17
vim.g.gui_font_size = vim.g.gui_font_default_size
RefreshGuiFont = function()
    vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
end
ResizeGuiFont = function(delta)
    vim.g.gui_font_size = vim.g.gui_font_size + delta
    RefreshGuiFont()
end
ResetGuiFont = function()
    vim.g.gui_font_size = vim.g.gui_font_default_size
    RefreshGuiFont()
end
ResetGuiFont()

vim.keymap.set({ "n", "i" }, "<C-+>", function()
    ResizeGuiFont(1)
end, { noremap = true, silent = true })
vim.keymap.set({ "n", "i" }, "<C-->", function()
    ResizeGuiFont(-1)
end, { noremap = true, silent = true })

-- Functions
-- vim.keymap.set('i', ')', function() return BracketClose(')') end, { buffer = true, expr = true })
-- vim.keymap.set('i', '}', function() return BracketClose('}') end, { buffer = true, expr = true })
-- vim.keymap.set('i', ']', function() return BracketClose(']') end, { buffer = true, expr = true })
-- vim.keymap.set('i', '<CR>', function() return BracketSplit() end, { buffer = true, expr = true })
function BracketClose(char)
    return char
end

function BracketSplit()
    local cursor = vim.api.nvim_win_get_cursor(0)
    local line = vim.api.nvim_get_current_line()
    local next_char = line[cursor[1] + 1]
    if next_char == ')' then
        return "<CR><CR><Up><Tab>"
    end

    return '<CR>'
end

-- local augroup = vim.api.nvim_create_augroup("BracketUtils", { clear = true })
-- vim.api.nvim_create_autocmd('InsertCharPre', {
--     group = augroup,
--     desc = "Utils for formating brackets with new lines",
--     callback = function()
--         if vim.v.char == "<CR>" then
--             -- if next char is ), } or ] then
--                 -- <CR> backspace upArrow <Tab>
--             -- end
--         -- elseif vim.v.char is ), } or ] then
--              local cursor = vim.api.nvim_win_get_cursor(0)
--              local current_line = vim.api.nvim_buf_get_lines(0, cursor[1], cursor[1]+1, false)
--             -- if line is blankspaces then
--                 -- <CR> backspace vim.v.char upArrow
--             -- end
--         end
--     end,
-- })
