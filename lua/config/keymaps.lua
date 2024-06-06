local mapkey = require("util.keymapper").mapvimkey
local keymap = vim.keymap -- for conciseness
local api = vim.api

-- Buffer Navigation
mapkey("<leader>bn", "bnext", "n") -- Next buffer
mapkey("<leader>bp", "bprevious", "n") -- Prev buffer
mapkey("<leader>bb", "e #", "n") -- Switch to Other Buffer
mapkey("<leader>`", "e #", "n") -- Switch to Other Buffer

-- Directory Navigatio}n
mapkey("<leader>m", "NvimTreeFocus", "n")
mapkey("<leader>e", "NvimTreeToggle", "n")

-- Pane and Window Navigation
mapkey("<C-h>", "<C-w>h", "n") -- Navigate Left
mapkey("<C-j>", "<C-w>j", "n") -- Navigate Down
mapkey("<C-k>", "<C-w>k", "n") -- Navigate Up
mapkey("<C-l>", "<C-w>l", "n") -- Navigate Right
mapkey("<C-h>", "wincmd h", "t") -- Navigate Left
mapkey("<C-j>", "wincmd j", "t") -- Navigate Down
mapkey("<C-k>", "wincmd k", "t") -- Navigate Up
mapkey("<C-l>", "wincmd l", "t") -- Navigate Right
mapkey("<C-h>", "TmuxNavigateLeft", "n") -- Navigate Left
mapkey("<C-j>", "TmuxNavigateDown", "n") -- Navigate Down
mapkey("<C-k>", "TmuxNavigateUp", "n") -- Navigate Up
mapkey("<C-l>", "TmuxNavigateRight", "n") -- Navigate Right

-- Window Management
mapkey("<leader>sv", "vsplit", "n") -- Split Vertically
mapkey("<leader>sh", "split", "n") -- Split Horizontally
mapkey("<C-Up>", "resize +2", "n")
mapkey("<C-Down>", "resize -2", "n")
mapkey("<C-Left>", "vertical resize +2", "n")
mapkey("<C-Right>", "vertical resize -2", "n")

-- Show Full File-Path
mapkey("<leader>pa", "echo expand('%:p')", "n") -- Show Full File Path

-- Notes
mapkey("<leader>ng", "Neorg workspace general", "n")
mapkey("<leader>nw", "Neorg workspace work", "n")
mapkey("<leader>ny", "Neorg workspace youtube", "n")

-- Indenting
vim.keymap.set("v", "<", "<gv", { silent = true, noremap = true })
vim.keymap.set("v", ">", ">gv", { silent = true, noremap = true })

-- Zen Mode
api.nvim_set_keymap("n", "<leader>zn", ":TZNarrow<CR>", {})
api.nvim_set_keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
api.nvim_set_keymap("n", "<leader>sm", ":TZFocus<CR>", {})
api.nvim_set_keymap("n", "<leader>zm", ":TZMinimalist<CR>", {})
api.nvim_set_keymap("n", "<leader>za", ":TZAtaraxis<CR>", {})

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader><tab>o", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader><tab>x", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader><tab>n", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader><tab>p", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader><tab>f", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Move selected text without buffer
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- better indenting
keymap.set("v", "<", "<gv", { desc = "Indent right" })
keymap.set("v", ">", ">gv", { desc = "Indent left" })
