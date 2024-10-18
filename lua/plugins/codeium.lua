return {
    "Exafunction/codeium.nvim",
    cmd = "Codeium",
    build = ":Codeium Auth",
    opts = {
        enable_chat = true, -- Ενεργοποίηση της λειτουργίας chat
    },
    opts = function(_, opts)
        -- Έλεγξε αν το opts.sources είναι πίνακας
        if not opts.sources then
            opts.sources = {}  -- Αν δεν είναι, αρχικοποίησέ το ως κενό πίνακα
        end

        table.insert(opts.sources, 1, {
            name = "codeium",
            group_index = 1,
            priority = 1000,
        })
    end,
}
