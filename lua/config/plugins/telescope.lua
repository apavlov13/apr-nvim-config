return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "andrew-george/telescope-themes",
    },

    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        telescope.load_extension("themes")

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                    },
                },
                extensions = {
                    themes = {
                        enable_previewer = true,
                        enable_live_preview = true,
                        persist = {
                            enabled = true,
                            path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua",
                        },
                    },
                },
            },
        })

        vim.keymap.set("n", "<leader>pr", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
        vim.keymap.set("n", "<leader>pWs", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end, { desc = "Find connected words under cursor" })
        vim.keymap.set("n", "<leader>ths", "<cmd>Telescope themes<CR>", { noremap = true, silent = true, desc = "Theme Switcher" })
    end
}
