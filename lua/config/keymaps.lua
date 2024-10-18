-- config/keymaps.lua

-- Ορισμός του keymap για Ctrl+A που επιλέγει όλο το κείμενο
vim.api.nvim_set_keymap("n", "<C-a>", "ggVG", { noremap = true, silent = true })
-- Ορισμός του keymap για Ctrl+A που επιλέγει όλο το κείμενο σε visual mode
vim.api.nvim_set_keymap("v", "<C-a>", "ggVG", { noremap = true, silent = true })
-- Αντιγραφή στο system clipboard
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { noremap = true, silent = true })
-- Επικόλληση από το system clipboard
vim.api.nvim_set_keymap("n", "<C-v>", '"+p', { noremap = true, silent = true })

-- Συντομεύσεις για την επεξεργασία
vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>") -- Επαναφόρτωση του init config
vim.keymap.set("n", "<leader>ev", ":e $MYVIMRC<CR>") -- Άνοιγμα του init config

-- Πλοήγηση μεταξύ παραθύρων
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Μετακίνηση γραμμών σε Visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Split windows
vim.keymap.set("n", "<leader>ws", ":split<CR>")
vim.keymap.set("n", "<leader>wv", ":vsplit<CR>")

-- Save και Quit
vim.keymap.set("n", "<C-s>", ":w<CR>") -- Save
vim.keymap.set("n", "<leader>q", ":q<CR>") -- Quit
vim.keymap.set("n", "<leader>wq", ":wq<CR>") -- Save and Quit

-- Comment lines (χρησιμοποιώντας το plugin 'numToStr/Comment.nvim' π.χ.)
vim.keymap.set("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>")
vim.keymap.set("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")

-- Συντομεύσεις για LSP
local opts = { noremap = true, silent = true }

-- Εντολές για επιλογές από το Alpha
vim.api.nvim_set_keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>f", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>r", ":Telescope oldfiles<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>g", ":Telescope live_grep<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>q", ":qa<CR>", { noremap = true, silent = true })

-- Χάρτης για LSP
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- Μετάβαση στον ορισμό
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) -- Hover
vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts) -- Μετονομασία
vim.api.nvim_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts) -- Δράσεις κώδικα
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts) -- Αναφορές
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts) -- Μορφοποίηση

-- Άνοιγμα/κλείσιμο του nvim-tree με το leader + e
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
-- Αναζήτηση αρχείων με το Telescope
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })
-- Αναζήτηση κειμένου μέσα σε αρχεία
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true })

-- ToggleTerm keymaps
vim.cmd([[
  autocmd TermEnter term://*toggleterm#*
        \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

  nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
  inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
]])

-- Συναρτήσεις για έλεγχο και αλλαγή κατάστασης του Live Server
local live_server_status = false
-- Συνάρτηση που ενεργοποιεί ή απενεργοποιεί τον Live Server
local function toggle_live_server()
	if live_server_status then
		vim.cmd("LiveServerStop") -- Σταμάτησε τον Live Server
		live_server_status = false -- Ενημέρωση της κατάστασης σε "σταματημένος"
		print("Live Server Stopped") -- Εμφανίζει μήνυμα ότι σταμάτησε
	else
		vim.cmd("LiveServerStart") -- Ξεκίνα τον Live Server
		live_server_status = true -- Ενημέρωση της κατάστασης σε "ενεργός"
		print("Live Server Started") -- Εμφανίζει μήνυμα ότι ξεκίνησε
	end
end
-- Ορισμός του Ctrl + L για εναλλαγή (toggle) Live Server
vim.keymap.set("n", "<C-l>", toggle_live_server, { noremap = true, silent = true })

-- νέο αρχείο
vim.api.nvim_set_keymap("n", "<C-f>", ":lua CreateNewFile()<CR>", { noremap = true, silent = true })

function CreateNewFile()
	local current_dir = vim.fn.expand("%:p:h") -- Παίρνει τον τρέχοντα φάκελο
	local file_name = vim.fn.input("Enter new file name: ", current_dir .. "/")

	if file_name ~= "" then
		vim.cmd("edit " .. file_name)
	else
		print("Invalid file name")
	end
end
