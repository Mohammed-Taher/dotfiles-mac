local separator = { '"▏"', color = 'StatusLineNonText' }


require('lualine').setup({
  options = {
    section_separators = '',
    component_separators = '',
    globalstatus = true,
    theme = {
      normal = {
        a = 'StatusLine',
        b = 'StatusLine',
        c = 'StatusLine',
      },
    },
  },
  sections = {
    lualine_a = {
      'mode',
      separator,
    },
    lualine_b = {
      'branch',
      'diff',
      separator,
      '"  " .. tostring(#vim.tbl_keys(vim.lsp.buf_get_clients()))',
      { 'diagnostics', sources = { 'nvim_diagnostic' } },
      separator,
    },
    lualine_c = {
      'filename'
    },
    lualine_x = {
      {
        require('noice').api.statusline.mode.get,
        cond = require('noice').api.statusline.mode.has,
        color = { fg = '#ff9e64' }
      },
      separator,
      {
        'filetype',
        icon_only = false,
        icon = { align = 'right' }
      },
      separator,
    },
    lualine_y = {
      '(vim.bo.expandtab and " " or " ") .. " " .. vim.bo.shiftwidth',
      separator,
    },
    lualine_z = {
      -- 'location',
      'progress',
      separator,
      function()
        local clock = os.date("%H:%M:%S", os.time())
        return clock
      end,
    },
  },
})
