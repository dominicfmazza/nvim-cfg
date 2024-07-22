local wk = require("which-key")
-- filetree keybinds

wk.add({
  {
    { "<leader>e", "<cmd>Neotree focus filesystem toggle<cr>", desc = "Filetree: Toggle" },
    { "<leader>o", "<cmd>Neotree focus filesystem<cr>",        desc = "Filetree: Focus" },
  }
})
