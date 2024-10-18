-- config/autocmds.lua

-- Auto-reload αρχείων όταν αλλάξουν εξωτερικά
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.lua",
    command = "source %",
})

-- Αυτόματο highlight του κειμένου όταν γίνεται αναζήτηση
vim.api.nvim_create_autocmd("CmdlineEnter", {
    pattern = "/,?",
    command = "set hlsearch",
})

-- Απενεργοποίηση του highlight όταν τελειώσει η αναζήτηση
vim.api.nvim_create_autocmd("CmdlineLeave", {
    pattern = "/,?",
    command = "set nohlsearch",
})

-- Απενεργοποίηση συνεχούς ενδιάμεσου αρχείου swap
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = "set noswapfile",
})

-- Αυτόματο κλείσιμο του Neovim όταν κλείνεις το τελευταίο buffer
vim.api.nvim_create_autocmd("BufDelete", {
    pattern = "*",
    command = "if len(getbufinfo({'buflisted': 1})) == 1 | quit | endif",
})

-- Αυτόματη ρύθμιση του filetype
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*",
    callback = function()
        vim.bo.filetype = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":e")
    end,
})

-- Αυτόματη αποθήκευση όταν βγαίνεις από insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
        local buftype = vim.bo.buftype
        local filetype = vim.bo.filetype

        -- Ελέγχει αν το buftype δεν είναι "lazy", "nofile" ή "nowrite"
        if filetype ~= "lazy" and buftype ~= "nofile" and buftype ~= "nowrite" then
            -- Επιπλέον έλεγχος για να βεβαιωθούμε ότι το buffer είναι ορατό
            if vim.fn.buflisted(vim.fn.bufnr('%')) ~= 0 then
                vim.cmd("w") -- Εκτελεί την εντολή αποθήκευσης
            end
        end
    end,
})

-- Διαχείριση Ανοίγματος Εξωτερικού Πίνακα
vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        if vim.g.toggle_cmp then
            -- Κώδικας για να ανοίξει το παράθυρο του Codeium ή κάποια ρύθμιση
            vim.notify("Codeium Suggestions Enabled", vim.log.levels.INFO, { title = "Codeium" })
        end
    end,
})

-- Αναγνώριση Αλλαγής Γλώσσας
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript", "typescript" },
    callback = function()
        -- Κώδικας για να προσαρμόσει το Codeium για αυτές τις γλώσσες
        vim.notify("Codeium configured for JavaScript/TypeScript", vim.log.levels.INFO, { title = "Codeium" })
    end,
})
