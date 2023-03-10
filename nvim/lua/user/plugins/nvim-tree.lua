require('nvim-tree').setup({
  git = {
    ignore = false,
  },
  renderer = {
    group_empty = true,
    icons = {
      glyphs = {
        git = {
          unstaged = " ",
          staged = " ",
          unmerged = " ",
          renamed = " ",
          untracked = " ",
          deleted = " ",
          ignored = " ",
        },
        folder = {
          arrow_closed = " ",
          arrow_open = " ",
          default = " ",
          open = " ",
          empty = " ",
          empty_open = " ",
          symlink = " ",
          symlink_open = " ",
        },
      },
      show = {
        folder_arrow = false,
      },
    },
    indent_markers = {
      enable = true,
    },
  },
})


