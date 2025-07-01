return {
    "askfiy/visual_studio_code",
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 100,

    config = function ()
        require("kanso").setup({
            theme = "mist",
            background = {
                light = "pearl",
                dark = "mist",
            },
        })
    end
}


