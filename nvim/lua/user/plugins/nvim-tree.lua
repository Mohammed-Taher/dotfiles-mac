require('nvim-tree').setup({
    git = {
      ignore = false,
    },
    renderer = {
      group_empty = true,
      icons = {
        glyphs = {
          git = {
            unstaged = "",
            staged = "",
            unmerged = "",
            renamed = "",
            untracked = "",
            deleted = "",
            ignored = "◌",
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

