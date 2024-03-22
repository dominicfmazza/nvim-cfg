local wk = require "which-key"

wk.register({
  b = {
    name = "+buffer",
    [","] = {
      function()
        require("nvchad.tabufline").prev()
      end,
      "Move Previous Buffer",
    },
    ["."] = {
      function()
        require("nvchad.tabufline").next()
      end,
      "Move Next Buffer",
    },
    ["c"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close Buffer",
    },
  },
}, {
  prefix = "<leader>",
  noremap = true,
  silent = true,
})
