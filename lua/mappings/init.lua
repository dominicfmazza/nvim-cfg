local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })

require "mappings.neotree"
require "mappings.gitsigns"
require "mappings.comment"
require "mappings.telescope"
require "mappings.buffer"
require "mappings.term.init"
require "mappings.orgmode"
require "mappings.leap"

local wk = require "which-key"

wk.register({
  w = { "<cmd>w<cr>", "Save" },
  q = { "<cmd>q<cr>", "Quit" },
  c = { "<cmd>close<cr>", "Close" },
}, { prefix = "<leader>" })

wk.register {
  ["<C-H>"] = { "<C-w>h", "Move to left split" },
  ["<C-J>"] = { "<C-w>j", "Move to below split" },
  ["<C-K>"] = { "<C-w>k", "Move to above split" },
  ["<C-L>"] = { "<C-w>l", "Move to right split" },
}


wk.register({
  ["J"] = { "5j", "Move to left split" },
  ["K"] = { "5k", "Move to above split" },
}, { noremap = true })

wk.register({
  ["<S-Tab>"] = { "<gv", "Unindent line" },
  ["<Tab>"] = { ">gv", "Indent line" },
}, { mode = "v" })

wk.register {
  ["|"] = { "<cmd>vsplit<cr>", "Vertical Split" },
  ["\\"] = { "<cmd>split<cr>", "Horizontal Split" },
}
