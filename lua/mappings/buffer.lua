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

for i = 1, 9, 1 do
  wk.register({
    [string.format("b%s", i)] = {
      function()
        vim.api.nvim_set_current_buf(vim.t.bufs[i])
      end,
      string.format("Move to buffer %s", i),
    },
  }, {
    prefix = "<leader>",
    noremap = true,
    silent = true,
  })
end
