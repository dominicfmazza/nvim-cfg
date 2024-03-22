return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre' -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },


  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "clangd",
        "neocmakelsp",
        "gersemi",
        "jedi-language-server",
        "clang-format",
        "remark-cli",
        "remark-language-server",
        "beautysh",
        "black",
        "jq-lsp",
        "jq"
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "cpp",
        "cuda",
        "c",
        "python",
        "markdown",
        "bash",
      },
    },
  },
}
