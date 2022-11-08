require('rubens.plugins')
require('rubens.options')
require('rubens.lsp')
require('rubens.cmp')
require('rubens.git')
require('rubens.telescope')
require('rubens.treesitter')
require('rubens.keymaps')

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,})

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
