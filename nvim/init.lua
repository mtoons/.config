vim.g.mapleader = " "
vim.g.maplocalleader = " "
Border = "single"

-- Install `lazy.nvim` plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    ui = {
        border = Border,
    },
})

-- Keymaps
-- Terminal
vim.keymap.set("n", "<leader>T", require "commands.terminal".ToggleTerminal,
    { silent = true, desc = "[T]erminal" })

-- Silent leader
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Spellcheck
vim.keymap.set("n", "<leader>cf", "<cmd>setlocal spell spelllang=fr<CR>",
    { silent = true, desc = "[C]heck [F]rench spelling" })
vim.keymap.set("n", "<leader>ce", "<cmd>setlocal spell spelllang=en<CR>",
    { silent = true, desc = "[C]heck [E]nglish spelling" })
vim.keymap.set("n", "<leader>cs", "<cmd>setlocal spell spelllang=es<CR>",
    { silent = true, desc = "[C]heck [S]panish spelling" })

-- Clear highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Alternate file
vim.keymap.set("n", "<leader><space>", "<C-^>")

-- Diagnostic
vim.keymap.set(
    "n",
    "<leader>d",
    vim.diagnostic.open_float,
    { desc = "[D]iagnostics", silent = true, }
)

-- Keep cursor in view
-- vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move lines
vim.keymap.set("v", "J", "<cmd>m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", "<cmd>m '<-2<CR>gv=gv")

-- Terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>") -- Escape
vim.keymap.set("t", "<C-v>", function()
    return '<C-\\><C-N>"+pi'
end, { expr = true })
vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>")

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

-- Column
vim.o.colorcolumn = "80,120"

-- Folds
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldlevelstart = 99

-- Nerd font
vim.g.have_nerd_font = true

-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Mouse
vim.o.mouse = "a"

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = "unnamedplus"

vim.o.showmode = false

-- Break indent
vim.o.breakindent = true

-- Undo history
vim.o.undofile = true

-- Conceal
vim.o.conceallevel = 2

-- Inlay hints
vim.lsp.inlay_hint.enable()

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

-- Neovide
vim.g.neovide_floating_corner_radius = 0.3

-- Autocmds
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight on yank",
    group = vim.api.nvim_create_augroup("HighOnYan", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
