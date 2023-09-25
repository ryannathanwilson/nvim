local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
  "                                                     ",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                     ",
}
-- Set menu
dashboard.section.buttons.val = {
  dashboard.button("e", "  > Open explorer", ":NvimTreeFindFileToggle<CR>"),
  dashboard.button("f", "  > Find file", "<cmd> lua require('rnw.plugin_config.telescope').find_project_files()<CR>"),
  dashboard.button("t", "  > Search text", ":Telescope live_grep<CR>"),
  dashboard.button("c", "  > Configuration", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
  dashboard.button("o", "  > Obsidian", ":ObsidianQuickSwitch<CR>"),
  dashboard.button("h", "  > Harpoon", ":lua require('harpoon.ui').toggle_quick_menu()<CR>"),
  dashboard.button("q", "  > Quit NeoVim", ":qa<CR>"),
}


-- Send config to alpha
require("alpha").setup(dashboard.opts)
