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

-- Clear highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Ctrl-v
vim.keymap.set({ "i", "c" }, "<C-v>", "<C-r>+")

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

-- Folds
vim.o.foldmethod = "indent"
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
