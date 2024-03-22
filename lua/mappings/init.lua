local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })

require("lua.mappings.nvimtree")
require("lua.mappings.gitsigns")
require("lua.mappings.comment")
require("lua.mappings.telescope")
require("lua.mappings.buffer")
require("lua.mappings.term")

local wk = require("which-key")

wk.register({
  w = { "<cmd>w<cr>", "Save" },
  q = { "<cmd>q<cr>", "Quit" },
  c = { "<cmd>close<cr>", "Close" },
}, { prefix = "<leader>" })

wk.register({
  ["<S-Tab>"] = { "<gv", "Unindent line" },
  ["<Tab>"] = { ">gv", "Indent line" }
}, { mode = "v" })
