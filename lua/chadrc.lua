---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
    term = {
    hl = "Normal:term,WinSeparator:WinSeparator",
    sizes = { sp = 0.4, vsp = 0.3 },
    float = {
      relative = "editor",
      row = 0.025,
      col = 0.05,
      width = 0.9,
      height = 0.8,
      border = "single",
    },
  },
}
return M
