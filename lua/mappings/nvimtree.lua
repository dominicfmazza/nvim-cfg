local wk = require("which-key")
-- filetree keybinds

wk.register({
  e = { "<cmd>Neotree focus filesystem toggle<cr>", "Filetree: Toggle" },
  o = { "<cmd>Neotree focus filesystem<cr>", "Filetree: Focus" },
}, { prefix = "<leader>" })
