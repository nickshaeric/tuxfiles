return {
    "shaunsingh/nord.nvim",
    priority = 1000,
    config = function()
        -- Nord global settings
        vim.g.nord_contrast = true
        vim.g.nord_borders = false
        vim.g.nord_disable_background = true
        vim.g.nord_italic = false
        vim.g.nord_bold = true
        vim.g.nord_uniform_diff_background = true
        vim.g.nord_cursor_line_number_background = false
 
        require("nord").set()
        vim.cmd("colorscheme nord")
    end,
}
