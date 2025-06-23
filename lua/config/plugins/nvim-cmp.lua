return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        {
            "L3MON4D3/LuaSnip",
            build = "make isntall_jsregexp",
        },
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        "nvim-treesitter/nvim-treesitter",
        "onsails/lspkind.nvim",
        "roobert/tailwindcss-colorizer-cmp.nvim",
    },
    config = function()
        local cmp = require("cmp")
        local has_luasnip, luasnip = pcall(require, "luasnip")
        local lspkind = require("lspkind")
        local colorizer = require("tailwindcss-colorizer-cmp").formatter

        local rha = function(keys)
            return vim.api.nvim_replace_termcodes(keys, true, true, true)
        end

        local lsp_kinds = {
            Class = ' ',
            Color = ' ',
            Constant = ' ',
            Constructor = ' ',
            Enum = ' ',
            EnumMember = ' ',
            Event = ' ',
            Field = ' ',
            File = ' ',
            Folder = ' ',
            Function = ' ',
            Interface = ' ',
            Keyword = ' ',
            Method = ' ',
            Module = ' ',
            Operator = ' ',
            Property = ' ',
            Reference = ' ',
            Snippet = ' ',
            Struct = ' ',
            Text = ' ',
            TypeParameter = ' ',
            Unit = ' ',
            Value = ' ',
            Variable = ' ',
        }

        local column = function()
            local _line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col
        end
    end
}
