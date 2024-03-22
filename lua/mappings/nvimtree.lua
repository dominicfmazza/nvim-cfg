local wk = require("which-key")
-- filetree keybinds

wk.register({
  e = { "<cmd>NvimTreeToggle<cr>", "Filetree: Toggle" },
  o = { "<cmd>NvimTreeFocus<cr>", "Filetree: Focus" },
}, { prefix = "<leader>" })
