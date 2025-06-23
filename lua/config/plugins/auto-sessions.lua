return {
    "rmagatti/auto-session",
    config = function()
        local auto_session = require("auto-session")

        auto_session.setup({
            auto_restore_enabled = true,
            auto_session_supress_dirs = { "~/" },
            auto_save = true,
        })

        vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session fro cwd" })
        vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for autio session root dir" })
    end
}
