return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local ok, harpoon = pcall(require, "harpoon")
        if not ok then return end

        harpoon:setup({
            settings = {
                save_on_toggle = true,
                sync_on_ui_close = true,
            },
        })

        local map = vim.keymap.set
        local opts = { noremap = true, silent = true }

        local list = harpoon:list()

        -- Add file
        map("n", "<leader>ha", function() list:add() end, opts)

        -- Quick menu
        map("n", "<leader>hh", function()
            harpoon.ui:toggle_quick_menu(list)
        end, opts)

        -- Direct navigation
        map("n", "<leader>h1", function() list:select(1) end, opts)
        map("n", "<leader>h2", function() list:select(2) end, opts)
        map("n", "<leader>h3", function() list:select(3) end, opts)
        map("n", "<leader>h4", function() list:select(4) end, opts)
    end,
}
