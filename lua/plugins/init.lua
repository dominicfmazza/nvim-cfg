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
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
      { "<leader>tl", "<cmd>LazyGit<cr>", desc = "LazyGit" },
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
        "markdown_inline",
        "bash",
      },
    },
  },
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      -- Setup orgmode
      require("orgmode").setup {
        org_agenda_files = "~/notes/**/*",
        org_default_notes_file = "~/notes/refile.org",
        mappings = { prefix = "<leader>n" },
      }
      require "configs.orgmode"
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "folke/trouble.nvim",
    branch = "main", -- IMPORTANT!
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
    opts = {}, -- for default options, refer to the configuration section for custom setup.
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "Bekaboo/dropbar.nvim",
    -- optional, but required for fuzzy finder support
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    lazy = false,
    opts = {
      bar = {
        sources = function(buf, _)
          local sources = require "dropbar.sources"
          local utils = require "dropbar.utils"
          if vim.bo[buf].ft == "markdown" then
            return {
              sources.path,
              sources.markdown,
            }
          end
          return {
            sources.path,
            utils.source.fallback {
              sources.lsp,
              sources.treesitter,
            },
          }
        end,
      },
    },
  },
  { "numToStr/Comment.nvim" },
  {
    "nmac427/guess-indent.nvim",
    opts = {},
    lazy = false,
  },
  {
    "ggandor/leap.nvim",
    lazy = false,
    dependencies = { "tpope/vim-repeat" },
  },
  {
    "nvim-tree/nvim-tree",
    enabled = false,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy=false,
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },
}
