---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
  cmp = {
    style = "atom_colored",
  },
  lsp_semantic_tokens = true,
  hl_add = {
    LineNRAbove = {
      fg = "folder_bg",
    },
    LineNRBelow = {
      fg = "pmenu_bg",
    },
    Search = {
      fg = "cyan",
      bg = "NONE",
      underline = true,
    },
    IncSearch = {
      fg = "baby_pink",
      bg = "NONE",
      underline = true,
    },
    CurSearch = {
      fg = "cyan",
      bg = "NONE",
      underline = true,
    },
    WinBar = {
      bg = "NONE",
      default = false,
    },
    WinBarNC = {
      bg = "NONE",
      default = false,
    },
    LeapLabel = {
      fg = "black",
      bg = "white",
      bold = true,
      nocombine = true,
    },
  },
  hl_override ={
    CursorLine = {
      bg = "one_bg",
    },
  }
}

M.term = {
  winopts = { winhl = "Normal:term,WinSeparator:WinSeparator" },
  hl = "Normal:term,WinSeparator:WinSeparator",
  sizes = { sp = 0.4, vsp = 0.5 },
  float = {
    relative = "editor",
    row = 0.025,
    col = 0.05,
    width = 0.9,
    height = 0.8,
    border = "single",
  },
}
return M
