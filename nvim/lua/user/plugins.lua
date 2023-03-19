local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
local use = require('packer').use

require('packer').reset()
require('packer').init({
    compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'solid' })
    end
   }
})

-- Packer can manage itself
use('wbthomason/packer.nvim')

-- Darcula colour theme
use({
  'aj-norman/darcula',
  config = function ()
      vim.cmd('colorscheme darcula')

      vim.api.nvim_set_hl(0, 'FloatBorder', {
        fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
        bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
      })

      -- make the cursor line invisible
      vim.api.nvim_set_hl(0, 'CursorLineBg', {
        fg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
        bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
      })
  end,
})

use('tpope/vim-commentary') -- Commenting Support
use('tpope/vim-surround') -- Add, Change and Delete surrounding text
use('tpope/vim-eunuch') -- Useful Commands like :Rename and :SudoWrite
use('tpope/vim-unimpaired') -- Pairs of handy bracket mappings, like [b and ]b
-- use('tpope/vim-sleuth') -- Indent autodetection with editorconfig support
use('tpope/vim-repeat') -- Allow plugins to enable repeating of commands
use('sheerun/vim-polyglot') -- Add More Languages
use('christoomey/vim-tmux-navigator') -- Navigate Seamlessly between Vim Windows and Tmux panels
use('farmergreg/vim-lastplace') -- Just to the last location when opening a file
use('nelstrom/vim-visual-star-search') -- Enable * searching with the visually select text
use('jessarcher/vim-heritage') -- Automatically create parent dirs when saving

 -- text objects for HTML attributes
use({
  'whatyouhide/vim-textobj-xmlattr',
  requires = 'kana/vim-textobj-user',
})

-- Automatically set the working directory to the project root.
use ({
  'airblade/vim-rooter',
    setup = function()
    -- Instead of this running every time we open a file, we'll just run it once when Vim starts.
    vim.g.rooter_manual_only = 1
  end,
  config = function()
    vim.cmd('Rooter')
  end,
})

-- Automatically add closing brackets, quotes, etc.
use({
  'windwp/nvim-autopairs',
  config = function ()
    require('nvim-autopairs').setup()
  end
})

-- Add smooth scrolling to avoid jarring jumps
use({
  'karb94/neoscroll.nvim',
  config = function ()
   require('neoscroll').setup()
  end,
})

-- All closing buffers without closing the split window.
use({
  'famiu/bufdelete.nvim',
  config = function ()
    vim.keymap.set ('n', '<Leader>q', ': Bdelete<CR>')
  end,
})

-- Split arrays and methods onto multiple lines, or join them back up.
use({
  'AndrewRadev/splitjoin.vim',
  config = function ()
    vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
    vim.g.splitjoin_trailing_comma = 1
    vim.g.splitjoin_php_method_chain_full = 1
  end,
})

-- Automatically fix indentation when pasting code.
use({
  'sickill/vim-pasta',
  config = function ()
    vim.g.pasta_disabled_filetypes = { 'fugitive' }
  end,
})

-- Fuzzy finder
use({
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'nvim-telescope/telescope-live-grep-args.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    },
    config = function ()
      require('user/plugins/telescope')
    end
})

-- File tree sidebar
use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function ()
      require('user/plugins/nvim-tree')
    end,
})

-- A Status Line replacement
use({
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function ()
      require('user/plugins/lualine')
    end,
})

-- Display buffers like tabs
use({
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    after = 'darcula',
    config = function ()
      require('user/plugins/bufferline')
    end,
})

-- Display indentation lines
use({
    'lukas-reineke/indent-blankline.nvim',
    config = function ()
      require('user/plugins/indent_blankline')
    end;
})

-- Add a dashboard
use({
    'glepnir/dashboard-nvim',
    config = function ()
      require('user/plugins/dashboard-nvim')
    end
})

-- Git integration
use({
  'Lewis6991/gitsigns.nvim',
  config = function ()
    require('user/plugins/gitsigns')
  end
})

-- Git Commands
use({
  'tpope/vim-fugitive',
  requires = 'tpope/vim-rubarb',
})

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
    require('packer').sync()
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])
