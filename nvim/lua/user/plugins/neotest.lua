require('neotest').setup({
  adapters = {
    require('neotest-phpunit'),
  }
})

vim.keymap.set('n', '<leader>t', [[<cmd>lua require('neotest').run.run()<CR>]])
vim.keymap.set('n', '<leader>tt', [[<cmd>lua require("neotest").summary.toggle()<Cr>]])
