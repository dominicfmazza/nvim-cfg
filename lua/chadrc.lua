---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
  term = {
    hl = "Normal:term,WinSeparator:WinSeparator",
    sizes = { sp = 0.4, vsp = 0.5},
    float = {
      relative = "editor",
      row = 0.025,
      col = 0.05,
      width = 0.9,
      height = 0.8,
      border = "single",
    },
  },
  cmp = {
    style = "atom_colored",
  },
  lsp_semantic_tokens = true,
}
return M
