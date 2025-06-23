return {
    { "echasnovski/mini.nvim", version = false },
    {
        "echasnovski/mini.comment",
        version = false,
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        config = function()
            require("ts_context_commentstring").setup {
                enable_autocmd = false,
            }
            require("mini.comment").setup {
                options = {
                    custom_commentstring = function()
                        return require("ts_context_commentstring.internal").calculate_commentstring({
                            key = "commentstring"
                        }) or vim.bo.commentstring
                    end,
                }
            }
        end
    },
    {
        "echasnovski/mini.files",
        config = function()
            local minifiles = require("mini.files")
            minifiles.setup({
                mappings = {
                    go_in = "<CR>",
                    go_in_plus = "L",
                    go_out = "-",
                    go_out_plus = "H",
                },
            })
            vim.keymap.set("n", "<leader>ee", function() minifiles.open() end, { desc = "Toggle mini file explorer" })
            vim.keymap.set("n", "<leader>ef", function()
                minifiles.open(vim.api.nvim_buf_get_name(0), false)
                minifiles.reveal_cwd()
            end, { desc = "Toggle mini file explorer" })
        end
    },
    {
        "echasnovski/mini.surround",
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        "echasnovski/mini.trailspace",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            local miniTrailspace = require("mini.trailspace")
            miniTrailspace.setup({
                only_in_normal_buffers = true,
            })
            vim.keymap.set("n", "<leader>cw", function() miniTrailspace.trim() end, { desc = "Erase Whitespace" })

            vim.api.nvim_create_autocmd("CursorMoved", {
                pattern = "*",
                callback = function()
                    miniTrailspace.unhighlight()
                end,
            })
        end
    },
    {
        "echasnovski/mini.splitjoin",
        config = function()
            local miniSplitJoin = require("mini.splitjoin")
            miniSplitJoin.setup({
                mappings = { toggle = "" },
            })

            vim.keymap.set({"n", "x"}, "sj", function() miniSplitJoin.join() end, {desc = "Join arguments" })
            vim.keymap.set({"n", "x"}, "sk", function() miniSplitJoin.split() end, {desc = "Split arguments" })
        end
    }
}
