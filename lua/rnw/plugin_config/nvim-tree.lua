require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  open_on_setup = false,
  renderer = {
    group_empty = true,
    icons = {
      git_placement = "after",
    },
  },
  filters = {
    dotfiles = false,
  },
  git = {
    ignore = false,
  },
})