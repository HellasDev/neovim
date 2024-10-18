-- init.lua
-- Κρατάμε space ως το leader key
vim.g.mapleader = " "
-- Ορισμός του mapleader
vim.g.maplocalleader = " " -- Επίσης για το τοπικό leader
-- Χρήση του system clipboard στο Neovim
vim.opt.clipboard = "unnamedplus"

vim.o.mouse = "a" -- Enable mouse support

-- Τώρα μπορείς να φορτώσεις το Lazy.nvim
require("config.lazy")

-- Φόρτωσε τα υπόλοιπα configurations
require("config.options")
require("config.autocmds")
require("config.keymaps")
