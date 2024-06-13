local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    cpp = { "clang_format" },
    rust = { "rustfmt" },
    cmake = { "gersemi" },
    python = { "black" },
    bash = { "beautysh" },
    markdown = { "prettierd" },
    json = { "prettierd" },
    yaml = { "prettierd" },
    javascript = {"prettierd"},
    typescript = {"prettierd"},
    vue = {"prettierd"},
  },
}

require("conform").setup(options)
