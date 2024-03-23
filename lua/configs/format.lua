local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    cpp = { "clang_format" },
    cmake = { "gersemi" },
    python = { "black" },
    bash = { "beautysh" },
    markdown = { "prettierd" },
    json = { "prettierd" },
    yaml = { "prettierd" },
  },
}

require("conform").setup(options)
