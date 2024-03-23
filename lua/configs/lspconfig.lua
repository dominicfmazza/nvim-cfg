-- EXAMPLE
-- local on_attach = require("nvchad.configs.lspconfig").on_attach

local conf = require("nvconfig").ui.lsp
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local wk = require "which-key"

wk.register({
  l = {
    name = "+lsp",
    d = { vim.diagnostic.open_float, "LSP: Open Diagnostics Float" },
    q = { vim.diagnostic.setloclist, "LSP: Set Loclist" },
  },
}, { prefix = "<leader>" })

-- export on_attach & capabilities
local custom_on_attach = function(client, bufnr)
  vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

  -- Buffer local mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  wk.register({
    l = {
      D = { vim.lsp.buf.declaration, "LSP: Goto declaration" },
      d = { vim.lsp.buf.definition, "LSP: Goto implementation" },
      i = { vim.lsp.buf.implementation, "LSP: Goto declaration" },
      r = { vim.lsp.buf.rename, "LSP: Rename" },
      R = { vim.lsp.buf.references, "LSP: References" },
      a = { vim.lsp.buf.code_action, "LSP: Code Action" },
      t = { vim.lsp.buf.type_definition, "LSP: Type Definition" },
      f = {
        function()
          require("conform").format { lsp_fallback = true }
        end,
        "LSP: Format",
      },
    },
  }, {
    prefix = "<leader>",
    buffer = bufnr,
  })
  wk.register({
    K = { vim.lsp.buf.hover, "LSP: Hover" },
    ["<C-k>"] = { vim.lsp.buf.signature_help, "LSP: Signature Help" },
  }, { buffer = bufnr })

  -- setup signature popup
  if conf.signature and client.server_capabilities.signatureHelpProvider then
    require("nvchad.lsp.signature").setup(client, bufnr)
  end
end

local servers = {
  "jqls",
  "neocmake",
  "jedi_language_server",
  "marksman"
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
