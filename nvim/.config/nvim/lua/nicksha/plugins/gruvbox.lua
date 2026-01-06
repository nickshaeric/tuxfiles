return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            terminal_colors = true,
            undercurl = true,
            underline = true,
            bold = true,
            inverse = true,
            contrast = "",
            transparent_mode = true,
            italic = {
                strings = false,
                folds = false,
                emphasis = false,
                operators = false,
            },
            overrides = {
                Pmenu = { bg = "" },
            },
            dim_inactive = false,
        })
        vim.cmd("colorscheme gruvbox")
    end,
}
