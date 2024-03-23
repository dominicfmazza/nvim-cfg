return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre' -- uncomment for format on save
    config = function()
      require "configs.format"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua
        "lua-language-server", -- lsp
        "stylua", -- formatter
        -- cmake
        "neocmakelsp", -- lsp
        "gersemi", -- formatter
        -- c++/cuda/c
        "clangd", -- lsp
        "clang-format", -- formatter
        -- markdown
        "marksman", -- markdown
        -- bash
        "bash-language-server", -- lsp
        "beautysh", -- formatter
        -- json
        "jq-lsp", -- lsp
        -- python
        "ruff", -- formatter
        "ruff-lsp", -- lsp
        -- yaml
        "yamlls", -- lsp
        -- docker
        "dockercompose-language-server", -- lsp
        "dockerfile-language-server", --lsp
        -- json/markdown/yaml
        "prettierd", -- formatter
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
        "cmake",
        "yaml",
        "python",
        "markdown",
        "bash",
      },
    },
  },
}
