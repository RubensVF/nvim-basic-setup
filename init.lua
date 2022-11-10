-- Init impatient plugin for faster startup 
require('impatient').enable_profile()

require('rubens.options') --Load first options for notify
require('noice').setup()
vim.notify('Hello boos' , 'info', { title = 'Hello' })
require('rubens.plugins')
require('rubens.lsp')
require('rubens.cmp')
require('rubens.git')
require('rubens.telescope')
require('rubens.treesitter')
require('rubens.keymaps')
require('nvim-tree').setup()
-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}
require('nvim-autopairs').setup()
require('Comment').setup()
-- -- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et 

require('nvim-ts-autotag').setup()
require('scrollbar').setup()
