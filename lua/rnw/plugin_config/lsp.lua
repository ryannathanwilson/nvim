local lspconfig = require("lspconfig")

-- Treesitter
require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = false,
  },
  ensure_installed = { 'javascript', 'typescript', 'lua', 'rust' }
})


local lsp_no_auto_format_list = { "tsserver" }

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
  on_attach = custom_attach,
  capabilities = capabilities,
}

lspconfig.eslint.setup({
  capabilities = capabilities,
  flags = { debounce_text_changes = 500 },
  on_attach = custom_attach,
  -- on_attach = function(client, _)
  --   client.server_capabilities.documentFormattingProvider = true
  --   if client.server_capabilities.documentFormattingProvider then
  --     local au_lsp = vim.api.nvim_create_augroup("eslint_lsp", { clear = true })
  --     vim.api.nvim_create_autocmd("BufWritePre", {
  --       pattern = "*",
  --       command = 'EslintFixAll',
  --       callback = function()
  --       vim.lsp.buf.format()
  --       end,
  --       group = au_lsp,
  --     })
  --   end
  -- end,
})

lspconfig.tsserver.setup {
  on_attach = custom_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
  capabilities = capabilities,
}

lspconfig.gopls.setup {
  on_attach = custom_attach,
  capabilities = capabilities,
}

lspconfig.lua_ls.setup {
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

lspconfig.svelte.setup{}
