local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })

require "mappings.nvimtree"
require "mappings.gitsigns"
require "mappings.comment"
require "mappings.telescope"
require "mappings.buffer"
require "mappings.term.init"
require "mappings.orgmode"

local wk = require "which-key"

wk.register({
  w = { "<cmd>w<cr>", "Save" },
  q = { "<cmd>q<cr>", "Quit" },
  c = { "<cmd>close<cr>", "Close" },
}, { prefix = "<leader>" })

wk.register({
  ["<S-Tab>"] = { "<gv", "Unindent line" },
  ["<Tab>"] = { ">gv", "Indent line" },
}, { mode = "v" })

wk.register {
  ["|"] = { "<cmd>vsplit<cr>", "Vertical Split" },
  ["\\"] = { "<cmd>split<cr>", "Horizontal Split" },
}
