local wk = require "which-key"
wk.add({
  { "<leader>b",    group = "+buffer" },
  {
    "<leader>b,",
    function()
      require("nvchad.tabufline").prev()
    end,
    desc = "Move Previous Buffer",
  },
  {
    "<leader>b.",
    function()
      require("nvchad.tabufline").next()
    end,
    desc = "Move Next Buffer",
  },
  {
    "<leader>bc",
    function()
      require("nvchad.tabufline").close_buffer()
    end,
    desc = "Close Buffer",
  }, { noremap = true, silent = true, }
})

for i = 1, 9, 1 do
  wk.add({
    {
      string.format("<leader>b%s", i),
      function()
        if vim.api.nvim_buf_is_valid(i)
        then
          vim.api.nvim_set_current_buf(vim.t.bufs[i])
        end
      end,
      desc = string.format("Move to buffer %s", i),
    },
  }, {
    noremap = true,
    silent = true,
  })
end
