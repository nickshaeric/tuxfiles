return {
    "stevearc/oil.nvim",
    config = function()
        require("oil").setup ({
            default_file_explorer = true,
            columns = { },
            keymaps = {
                ["<C-h>"] = false,
                ["<C-c>"] = false,
                ["q"] = "actions.close",
            },
            delete_to_trash = true,
            view_options = {
                show_hidden = true,
            },
            skip_confirm_for_simple_edits = true,
        })

        -- keymaps
        vim.keymap.set("n", "-", "<CMD>Oil<CR>")
        vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
    end
}
