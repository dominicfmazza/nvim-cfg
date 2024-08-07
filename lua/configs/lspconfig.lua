-- EXAMPLE
-- local on_attach = require("nvchad.configs.lspconfig").on_attach

local conf = require("nvconfig").lsp
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local wk = require "which-key"
require("mason-null-ls").setup({
  ensure_installed = {
    -- lua
    "lua-language-server", -- lsp
    "stylua",             -- formatter
    -- cmake
    "neocmakelsp",        -- lsp
    "gersemi",            -- formatter
    -- c++/cuda/c
    "clangd",             -- lsp
    "clang-format",       -- formatter
    -- markdown
    "marksman",           -- markdown
    -- bash
    "bash-language-server", -- lsp
    "beautysh",           -- formatter
    -- json
    "jq-lsp",             -- lsp
    -- python
    "jedi-language-server",
    "ruff",                     -- formatter
    "ruff-lsp",                 -- lsp
    -- yaml
    "yaml-language-server",     -- lsp
    -- docker
    "dockerfile-language-server", --lsp
    -- json/markdown/yaml
    "prettierd",                -- formatter
    "biome",
  }
})
wk.add({
  { "<leader>l",  group = "+lsp" },
  { "<leader>lx", vim.diagnostic.open_float, desc = "Open LSP Diagnostics" },
  { "<leader>lq", vim.diagnostic.open_float, desc = "Set LSP Loclist" }
})

-- export on_attach & capabilities
local custom_on_attach = function(client, bufnr)
  vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

  -- Buffer local mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  wk.add({
    { "<leader>lD", vim.lsp.buf.declaration,                          desc = "Goto declaration" },
    { "<leader>ld", require("telescope.builtin").lsp_implementations, desc = "Goto implementation" },
    { "<leader>li", require("telescope.builtin").lsp_definitions,     desc = "Goto declaration" },
    {
      "<leader>lr",
      function()
        require "nvchad.lsp.renamer" ()
      end,
      desc = "Rename",
    },
    { "<leader>lR", require("telescope.builtin").lsp_references,        desc = "References" },
    { "<leader>la", vim.lsp.buf.code_action,                            desc = "Code Action" },
    { "<leader>lS", require("telescope.builtin").lsp_workspace_symbols, desc = "Workspace Symbols" },
    { "<leader>ls", require("telescope.builtin").lsp_document_symbols,  desc = "Document Symbols" },
    { "<leader>lt", require("telescope.builtin").lsp_type_definitions,  desc = "Type Definition" },
    {
      "<leader>lf",
      function()
        require("conform").format { lsp_fallback = true }
      end,
      desc = "Format",
    },
    {
      buffer = bufnr,
    }
  })

  wk.add({
    { "<C-K>",       vim.lsp.buf.hover,          desc = "Hover LSP Help" },
    { "<C-s>",       vim.lsp.buf.signature_help, desc = "LSP Signature Help" },
    { buffer = bufnr } })

  -- setup signature popup
  if conf.signature and client.server_capabilities.signatureHelpProvider then
    require("nvchad.lsp.signature").setup(client, bufnr)
  end
end

local servers = {
  "jqls",
  "neocmake",
  "marksman",
  "docker_compose_language_service",
  "dockerls",
  "jedi_language_server",
  "bashls",
  "ruff_lsp",
  "jsonls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = custom_on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

require("lspconfig").lua_ls.setup {
  on_attach = custom_on_attach,
  capabilities = capabilities,
  on_init = on_init,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

require("lspconfig").clangd.setup {
  on_attach = custom_on_attach,
  capabilities = capabilities,
  on_init = on_init,

  root_dir = require("lspconfig").util.root_pattern(
    ".clangd",
    ".clang-tidy",
    ".clang-format",
    "compile_commands.json",
    "build/compile_commands.json",
    "compile_flags.txt",
    "configure.ac",
    ".git"
  ),
}

require("lspconfig").yamlls.setup {
  on_attach = custom_on_attach,
  capabilities = capabilities,
  on_init = on_init,

  settings = {
    yaml = {
      schemas = {
        ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = ".gitlab-ci.yml",
      },
      customTags = {
        "!reference sequence",
      },
    },
  },
}

-- -- If you are using mason.nvim, you can get the ts_plugin_path like this
-- local mason_registry = require "mason-registry"
-- local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
--   .. "/node_modules/@vue/language-server"
--
-- lspconfig.tsserver.setup {
--   on_attach = custom_on_attach,
--   capabilities = capabilities,
--   on_init = on_init,
--
--   init_options = {
--     plugins = {
--       {
--         name = "@vue/typescript-plugin",
--         location = vue_language_server_path,
--         languages = { "vue" },
--       },
--     },
--   },
--   filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
-- }
--
-- -- No need to set `hybridMode` to `true` as it's the default value
-- lspconfig.volar.setup {}
--
-- -- lspconfig.harper_ls.setup {
-- --   on_attach = custom_on_attach,
-- --   on_init = on_init,
-- --   capabilities = capabilities,
-- --
-- --   settings = {
-- --     ["harper-ls"] = {
-- --       userDictPath = vim.o.runtimepath .. "lua/configs/dict.txt"
-- --     }
-- --   },
-- -- }
