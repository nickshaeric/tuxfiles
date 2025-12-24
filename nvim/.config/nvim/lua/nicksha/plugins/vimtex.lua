return {
    "lervag/vimtex",
    lazy = false,
    init = function()
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_view_automatic = 1
        vim.g.vimtex_view_skim_sync = 1
        vim.g.vimtex_view_skim_activate = 1
        vim.g.vimtex_view_skim_reading_bar = 1
        vim.g.vimtex_view_skim_refresh = 1

        vim.g.vimtex_compiler_method = "latexmk"
        vim.g.vimtex_compiler_start = 0

        vim.g.vimtex_compiler_latexmk = {
            build_dir = "build",
            callback = 1,
            continuous = 1,
            executable = "latexmk",
            options = {
                "-pdf",
                "-interaction=nonstopmode",
                "-synctex=1",
            },
        }
    end,
}
