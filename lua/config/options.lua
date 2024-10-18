-- config/options.lua

local set = vim.opt -- Συντόμευση για να θέτουμε επιλογές

-- Εμφάνιση γραμμών και στηλών αριθμών
set.number = true
set.relativenumber = true

-- Πλάτος ταμπ στο indentation
set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true -- Μετατρέπει tabs σε spaces

-- Ενεργοποίηση του mouse
set.mouse = "a"

-- Ενεργοποίηση του clipboard (για αντιγραφή/επικόλληση από σύστημα)
set.clipboard = "unnamedplus"

-- Καλύτερη εμφάνιση γραμμών και scrolling
set.wrap = false -- Χωρίς word wrap
set.scrolloff = 8 -- Ξεκινάει scrolling 8 γραμμές πριν το τέλος
set.sidescrolloff = 8

-- Ενεργοποίηση 24-bit χρωμάτων (true colors)
set.termguicolors = true

-- Ενεργοποίηση του highlight της τρέχουσας γραμμής
set.cursorline = true

-- Αφαίρεση του backup και swap files
set.backup = false
set.writebackup = false
set.swapfile = false

-- Ενεργοποίηση του split για οριζόντια και κάθετα παράθυρα
set.splitbelow = true
set.splitright = true

-- Αυτόματη αποθήκευση όταν χάνεται το focus του Neovim
set.autowrite = true

-- Ενεργοποίηση ενημερωμένων ελέγχων στο LSP
vim.o.completeopt = "menuone,noselect"

-- Ενεργοποίηση αυτόματης ενημέρωσης κατά την πληκτρολόγηση
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focus = false }) -- Άνοιγμα float με διαγνωστικά
	end,
})

-- Enable the option to require a Prettier config file
-- If no prettier config file is found, the formatter will not be used
vim.g.lazyvim_prettier_needs_config = false

vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20"
