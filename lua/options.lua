require "nvchad.options"

local opt = vim.opt

-- global options --
opt.incsearch = true -- Find the next match as we type the search
opt.hlsearch = true -- Hilight searches by default
opt.viminfo = "'100,f1" -- Save up to 100 marks, enable capital marks
opt.ignorecase = true -- Ignore case when searching...
opt.smartcase = true -- ...unless we type a capital
opt.autoindent = true
opt.smartindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.termguicolors = true
opt.cursorline = true
opt.relativenumber = false
opt.number = true
opt.signcolumn = "yes:2"

function my_paste(reg)
  return function(lines)
    local content = vim.fn.getreg '"'
    return vim.split(content, "\n")
  end
end

opt.clipboard:append "unnamedplus"
vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy "+",
    ["*"] = require("vim.ui.clipboard.osc52").copy "*",
  },
  paste = {
    ["+"] = my_paste "+",
    ["*"] = my_paste "*",
  },
}
