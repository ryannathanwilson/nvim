require("obsidian").setup({
  dir = "~/Obsidian",
  notes_subdir = "Notes",
  log_level = vim.log.levels.DEBUG,
  daily_notes = {
    folder = "Daily Note",
    date_format = "%Y-%m-%d"
  },
  completion = {
    nvim_cmp = true,
    min_chars = 2,
    new_notes_location = "current_dir",
    prepend_note_id = true
  },

  mappings = {
    ["gd"] = require("obsidian.mapping").gf_passthrough(),
  },

  note_id_func = function(title)
    local suffix = ""
    if title ~= nil then
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    return tostring(os.time()) .. "-" .. suffix
  end,

  disable_frontmatter = false,

  note_frontmatter_func = function(note)
    local out = { id = note.id, aliases = note.aliases, tags = note.tags }
    if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end
    return out
  end,

  -- Optional, for templates (see below).
  templates = {
    subdir = "Templates",
    date_format = "%Y-%m-%d-%a",
    time_format = "%H:%M",
  },

  -- Optional, customize the backlinks interface.
  backlinks = {
    -- The default height of the backlinks pane.
    height = 10,
    -- Whether or not to wrap lines.
    wrap = true,
  },

  follow_url_func = function(url)
    -- Open the URL in the default web browser.
    vim.fn.jobstart({ "open", url }) -- Mac OS
    -- vim.fn.jobstart({"xdg-open", url})  -- linux
  end,

  use_advanced_uri = true,
  open_app_foreground = false,
  finder = "telescope.nvim",
  open_notes_in = "current"
})
