require('mason').setup();
require('mason-lspconfig').setup();
local lspconfig = require("lspconfig")

local lsp_no_auto_format_list = { "ts_ls" }

local found_in_table = function(item_to_check, table)
  for _, value in ipairs(table) do
    if item_to_check == value then
      return true
    end
  end
  return false
end

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      local shouldFormat = not found_in_table(client.name, lsp_no_auto_format_list) and client.name ~= "eslint"
      return shouldFormat
    end,
    bufnr = bufnr,
  })
end

-- Specify how the border looks like
local border = 'rounded'

-- Add the border on hover and on signature help popup window
local handlers = {
  ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = border,
    title = ' Language Server Protocol ',
  }),
  ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = border,
    title = 'Signature help',
  }),
}

-- -- Add border to the diagnostic popup window
vim.diagnostic.config({
  virtual_text = false,
  float = {
    border = border,
    show_header = false,
    source = 'always',
    focus = false,
    width = 60
  },
})
-- Add the border (handlers) to the lua language server
lspconfig.lua_ls.setup({
  handlers = handlers,
  -- The rest of the server configuration
})

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local custom_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'grr', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'dp', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', 'dn', vim.diagnostic.goto_next, bufopts)
  vim.keymap.set('n', 'do', vim.diagnostic.open_float, bufopts)

  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
  if client.name == 'eslint' then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      pattern = "*",
      command = 'silent! EslintFixAll',
    })
  end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.cssls.setup {
  handlers = handlers,
  on_attach = custom_attach,
  capabilities = capabilities,
}

lspconfig.eslint.setup({
  handlers = handlers,
  capabilities = capabilities,
  flags = { debounce_text_changes = 500 },
  on_attach = custom_attach,
})

lspconfig.ts_ls.setup {
  handlers = handlers,
  on_attach = custom_attach,
  filetypes = {
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "javascript",
    "javascriptreact",
    "javascript.jsx",
  },
  capabilities = capabilities,
}

lspconfig.gopls.setup {
  handlers = handlers,
  on_attach = custom_attach,
  capabilities = capabilities,
}

lspconfig.lua_ls.setup {
  handlers = handlers,
  on_attach = custom_attach,
  capabilities = capabilities,
  cmd = { 'lua-language-server' },
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim', 'use' }
      }
    }
  }
}

lspconfig.rust_analyzer.setup {
  handlers = handlers,
  on_attach = custom_attach,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true
      },
    }
  }
}

lspconfig.svelte.setup {
  handlers = handlers,
  on_attach = custom_attach,
  capabilities = capabilities,
}

local configs = require 'lspconfig/configs'

if not configs.cssmodules then
  configs.cssmodules = {
    default_config = {
      cmd = { 'cssmodules-language-server' },
      filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
      init_options = {
        camelCase = 'dashes',
      },
      root_dir = require('lspconfig.util').root_pattern('package.json')
    },
    docs = {
      description = 'TODO description',
      default_config = {
        root_dir = '[[root_pattern("package.json")]]'
      }
    }
  }
end

configs.cssmodules.setup {}
