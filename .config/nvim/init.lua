function string:split(sSeparator, nMax, bRegexp)
	assert(sSeparator ~= '')
	assert(nMax == nil or nMax >= 1)

	local aRecord = {}

	if self:len() > 0 then
		local bPlain = not bRegexp
		nMax = nMax or -1

		local nField, nStart = 1, 1
		local nFirst,nLast = self:find(sSeparator, nStart, bPlain)
		while nFirst and nMax ~= 0 do
			aRecord[nField] = self:sub(nStart, nFirst-1)
			nField = nField+1
			nStart = nLast+1
			nFirst,nLast = self:find(sSeparator, nStart, bPlain)
			nMax = nMax-1
		end
		aRecord[nField] = self:sub(nStart)
	end

	return aRecord
end

-- use .config folder for vim runtime and packages
local splitRuntimePath = string.split(vim.o.runtimepath, ",")
splitRuntimePath[1] = "~/.config/nvim"
splitRuntimePath[#splitRuntimePath] = "~/.config/nvim/after"
vim.o.runtimepath = table.concat(splitRuntimePath, ",")

local splitPackPath = string.split(vim.o.packpath, ",")
splitPackPath[1] = "~/.config/nvim"
splitPackPath[#splitRuntimePath] = "~/.config/nvim/after"
vim.o.packpath = table.concat(splitPackPath, ",")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		-- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
		},
	},
	{
		-- Autocompletion
		'hrsh7th/nvim-cmp',
		dependencies = {
			-- Adds LSP completion capabilities
			'hrsh7th/cmp-nvim-lsp',
		},
	},
}, {})

-- use tab characters rather than spaces
vim.o.expandtab = false

-- show line numbers
vim.o.number = true

-- highlight the cursor's column and underline its line
vim.o.cursorline = true
vim.o.cursorcolumn = true

-- two-space tabs
vim.o.tabstop = 2

-- two-space indents
vim.o.shiftwidth = 2

-- no backup files
vim.o.backup = false

-- don't wrap lines
vim.o.wrap = false

-- incremental search
vim.o.incsearch = true

-- don't ignore case
vim.o.ignorecase = false

-- use highlighting
vim.o.hlsearch = true

-- 1000-line history
vim.o.history = 1000

-- show current mode of operation (INSERT, VISUAL, etc.)
vim.o.showmode = true

-- cursor will briefly jump to matching open paren when typing closing paren
vim.o.showmatch = true

-- automatically indent when creating new lines
vim.o.smartindent = true

-- looks best with flux
vim.cmd.colorscheme("torte")

-- show line number and character position
vim.o.ruler = true

-- torte color scheme causes line to be highlighted rather than underlined
-- this changes it back to an underline
vim.api.nvim_set_hl(0, "CursorLine", { underline=true })

-- use block cursor (for nvim)
-- nvim breaks cursor blink settings from mintty on windows, so set it here
vim.o.guicursor = "n-v-c-i:block-blinkwait0-blinkon500-blinkoff500"

-- fix running external commands
vim.o.shellcmdflag = "-c"

-- remove the need to add quotes for external commands with ! like vim
vim.o.shellquote = "\""

-- disable nvim's python styling
vim.g.python_recommended_style = 0
