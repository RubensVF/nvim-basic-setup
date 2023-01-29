-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
	vim.cmd [[packadd packer.nvim]]
end


-- stylua: ignore start
require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- Package manager
	use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- Add git related info in the signs columns and popups
	use 'nvim-treesitter/nvim-treesitter' -- Highlight, edit, and navigate code
	use { 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } } -- Additional textobjects for treesitter
	use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
	use 'williamboman/mason.nvim' -- Manage external editor tooling i.e LSP servers
	use 'williamboman/mason-lspconfig.nvim' -- Automatically install language servers to stdpath
	use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } } -- Autocompletion
	use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } } -- Snippet Engine and Snippet Expansion
	use 'Mofiqul/dracula.nvim' -- Dracula theme
	use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
	use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } } -- File explorer
	use { 'numToStr/Comment.nvim' } -- Comment lines of code
	use { "windwp/nvim-autopairs" } -- Close automatically pairs like ( [ {
	-- Fuzzy Finder (files, lsp, etc)
	use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable "make" == 1 }

	use { "github/copilot.vim" } -- Github copilot suggest code

	use { 'segeljakt/vim-silicon' } -- Screen shot code visual mode
	use("petertriho/nvim-scrollbar") -- Scrollbar
	use { "windwp/nvim-ts-autotag" } -- Auto close tags
	--Use impatient
	use { "lewis6991/impatient.nvim" }

	use({
		"folke/noice.nvim", -- Ui plugin for cmdline and notifies
		requires = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		}
	})

	use { "mfussenegger/nvim-jdtls"}
        use 'simrat39/rust-tools.nvim'
	if is_bootstrap then
		require('packer').sync()
	end
end)
-- stylua: ignore end

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
	print '=================================='
	print '    Plugins are being installed'
	print '    Wait until Packer completes,'
	print '       then restart nvim'
	print '=================================='
	return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
	command = 'source <afile> | PackerCompile',
	group = packer_group,
	pattern = vim.fn.expand '$MYVIMRC',
})
