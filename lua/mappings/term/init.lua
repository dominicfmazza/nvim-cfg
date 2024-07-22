local wk = require "which-key"

wk.add({
  { "<leader>t",    group = "+terminal" },
  {
    "<leader>tv",
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
    desc = "Vertical Split Terminal",
  }, -- vertical
  {
    "<leader>th",
    function()
      require("nvchad.term").toggle {
        pos = "sp",
        id = "htoggleTerm",
      }
    end,
    desc = "Horizontal Split Terminal"
  }, -- horizontal
  {
    "<leader>tf",
    function()
      require("nvchad.term").toggle {
        pos = "float",
        id = "floatTerm",
      }
    end,
    desc = "Float",
  }, { noremap = true, silent = true } -- float
})

local map = vim.keymap.set

map("t", "<ESC><ESC>", function()
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_close(win, true)
end, { desc = "Terminal Close term in terminal mode" })

require "mappings.term.build"
