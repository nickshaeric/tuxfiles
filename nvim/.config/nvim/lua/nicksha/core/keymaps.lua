local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader Shortcuts
keymap("n", "<leader>w", "<cmd>w<CR>", opts)
keymap("n", "<leader>q", "<cmd>q<CR>", opts)
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Buffer
keymap("n", "<leader>bn", "<cmd>bnext<CR>", opts)
keymap("n", "<leader>bp", "<cmd>bprevious<CR>", opts)
keymap("n", "<leader>bd", "<cmd>bdelete!<CR>", opts)

-- Edit
keymap("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
keymap("v", "K", ":m '>-2<CR>gv=gv", { silent = true })

--Split
keymap("n", "<leader>sv", "<C-w>v", opts)
keymap("n", "<leader>sh", "<C-w>s", opts)
keymap("n", "<leader>sx", "<cmd>close<CR>", opts)

-- Terminal mode keymaps
keymap("t", "<Esc>", [[<C-\><C-n>]], opts)
keymap("t", "<C-h>", "<cmd>wincmd h<CR>", opts)
keymap("t", "<C-j>", "<cmd>wincmd j<CR>", opts)
keymap("t", "<C-k>", "<cmd>wincmd k<CR>", opts)
keymap("t", "<C-l>", "<cmd>wincmd l<CR>", opts)
keymap("t", "<C-q>", "<cmd>close<CR>", opts)
