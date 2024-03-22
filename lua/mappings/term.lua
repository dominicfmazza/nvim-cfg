local wk = require "which-key"

local lazygit_toggle = function()
  require("nvchad.term").toggle {
    pos = "float",
    id = "floatgit",
    cmd = "lazygit",
    float_opts = {
      border = "double",
    },
    size = 0.8,
  }
  vim.api.nvim_buf_set_keymap(
    0,
    "t",
    "q",
    "<cmd>lua vim.api.nvim_win_close(vim.api.nvim_get_current_win(), true) <CR>",
    { noremap = true, silent = true }
  )
end

wk.register(
  { g = { name = "+git", g = { lazygit_toggle, "LazyGit" } } },
  { noremap = true, silent = true, prefix = "<leader>" }
)
wk.register({
  t = {
    name = "+terminal",
    l = { lazygit_toggle, "LazyGit" },
    v = {
      function()
        require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm", size = 0.3 }
      end,
      "Vertical",
    }, -- vertical
    h = {
      function()
        require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm", size = 0.3 }
      end,
      "Horizontal",
    }, -- horizontal
    f = {
      function()
        require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
      end,
      "Float",
    }, -- float
  },
}, { noremap = true, silent = true, prefix = "<leader>" })

local map = vim.keymap.set

map("t", "<ESC>", function()
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_close(win, true)
end, { desc = "Terminal Close term in terminal mode" })
