return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local alpha = require("alpha")

    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      -- [[                                                                       ]],
      -- [[                                                                       ]],
      -- [[                                                                       ]],
      -- [[                                                                       ]],
      -- [[                                                                     ]],
      -- [[       ████ ██████           █████      ██                     ]],
      -- [[      ███████████             █████                             ]],
      -- [[      █████████ ███████████████████ ███   ███████████   ]],
      -- [[     █████████  ███    █████████████ █████ ██████████████   ]],
      -- [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      -- [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      -- [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      -- [[                                                                       ]],
      -- [[                                                                       ]],
      -- [[                                                                       ]],
      "                                                     ",
      "  ██   ██ ███████  ████  ██    ██ ██ ██      ██ ",
      "  ██  ██ ██      ██    ██ ██    ██ ██ ██  ╗ ██ ",
      "  ██   ██ █████   ██    ██ ██    ██ ██ ██      ██ ",
      "  ██    ██ ██      ██    ██      ██ ██        ██ ",
      "  ██    ██ ███████  ████         ██ ██        ██ ",
      "                                                     ",
    }
    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > Open explorer", ":Neotree toggle position=current<CR>"),
      dashboard.button("f", "  > Find file", "<cmd> lua require('functions').find_project_files()<CR>"),
      dashboard.button("t", "  > Search text", ":Telescope live_grep<CR>"),
      dashboard.button("c", "  > Configuration", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
      -- dashboard.button("o", "  > Obsidian", ":ObsidianQuickSwitch<CR>"),
      dashboard.button("h", "  > Harpoon", ":lua require('harpoon.ui').toggle_quick_menu()<CR>"),
      dashboard.button("q", "X  > Quit NeoVim", ":qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)
  end,
}
