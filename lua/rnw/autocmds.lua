local M = {}

local get_format_on_save_opts = function()
  local defaults = require("nvim.config.defaults").format_on_save
  -- accept a basic boolean `nvim.format_on_save=true`
  if type(nvim.format_on_save) ~= "table" then
    return defaults
  end

  return {
    pattern = nvim.format_on_save.pattern or defaults.pattern,
    timeout = nvim.format_on_save.timeout or defaults.timeout,
  }
end


function M.enable_format_on_save()
  local opts = get_format_on_save_opts()
  vim.api.nvim_create_augroup("lsp_format_on_save", {})
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = "lsp_format_on_save",
    pattern = opts.pattern,
    callback = function()
      require("nvim.lsp.utils").format { timeout_ms = opts.timeout, filter = opts.filter }
    end,
  })
  Log:debug "enabled format-on-save"
end

function M.disable_format_on_save()
  M.clear_augroup "lsp_format_on_save"
  Log:debug "disabled format-on-save"
end

function M.configure_format_on_save()
  if type(nvim.format_on_save) == "table" and nvim.format_on_save.enabled then
    M.enable_format_on_save()
  elseif nvim.format_on_save == true then
    M.enable_format_on_save()
  else
    M.disable_format_on_save()
  end
end

function M.toggle_format_on_save()
  local exists, autocmds = pcall(vim.api.nvim_get_autocmds, {
    group = "lsp_format_on_save",
    event = "BufWritePre",
  })
  if not exists or #autocmds == 0 then
    M.enable_format_on_save()
  else
    M.disable_format_on_save()
  end
end

function M.enable_reload_config_on_save()
  -- autocmds require forward slashes (even on windows)
  local pattern = get_config_dir():gsub("\\", "/") .. "/*.lua"

  vim.api.nvim_create_augroup("nvim_reload_config_on_save", {})
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = "nvim_reload_config_on_save",
    pattern = pattern,
    desc = "Trigger nvimReload on saving config.lua",
    callback = function()
      require("nvim.config"):reload()
    end,
  })
end

return M
