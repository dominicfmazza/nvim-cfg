local wk = require "which-key"

wk.register({
  t = {
    name = "+terminal",
    v = {
      function()
        require("nvchad.term").toggle {
          pos = "vsp",
          id = "vtoggleTerm",
          float_opts = {
            width = 0.8,
            height = 0.8,
          },
        }
      end,
      "Vertical",
    }, -- vertical
    h = {
      function()
        require("nvchad.term").toggle {
          pos = "sp",
          id = "htoggleTerm",
        }
      end,
      "Horizontal",
    }, -- horizontal
    f = {
      function()
        require("nvchad.term").toggle {
          pos = "float",
          id = "floatTerm",
        }
      end,
      "Float",
    }, -- float
  },
}, { noremap = true, silent = true, prefix = "<leader>" })

local map = vim.keymap.set

map("t", "<ESC><ESC>", function()
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_close(win, true)
end, { desc = "Terminal Close term in terminal mode" })

require "mappings.term.build"
