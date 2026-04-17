return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        config = function()
            -- Import nvim-treesitter plugin
            local treesitter = require("nvim-treesitter.configs")

            -- Configure treesitter
            treesitter.setup({
                highlight = {
                    enable = true,
                },
                indent = { enable = true },
                ensure_installed = {
                    "bash",
                    "c",
                    "css",
                    "gitignore",
                    "go",
                    "java",
                    "javascript",
                    "typescript",
                    "json",
                    "latex",
                    "python",
                    "markdown",
                    "markdown_inline",
                    "lua",
                    "rust",
                    "vim",
                    "vimdoc",
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = false,
                    },
                },
                additional_vim_regex_highlighting = false,
            })
        end,
    },
}
