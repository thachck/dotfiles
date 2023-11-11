-----------------------------------------------------------
-- File manager configuration file
-----------------------------------------------------------

-- Plugin: nvim-tree
-- url: https://github.com/kyazdani42/nvim-tree.lua

--- Keybindings are defined in `keymapping.lua`:
--- https://github.com/kyazdani42/nvim-tree.lua#keybindings

--- Note: options under the g: command should be set BEFORE running the
--- setup function: https://github.com/kyazdani42/nvim-tree.lua#setup
--- See: `help NvimTree`
local g = vim.g

g.nvim_tree_width_allow_resize  = 1

require('nvim-tree').setup {
  respect_buf_cwd = true,
  update_cwd = true,
  renderer = {
    highlight_git = 1,
    highlight_opened_files = 1,
    icons = {
      glyphs = {
        default = "‣ "
      },
      show = {
        git = 1,
        folders = 1,
        files = 1
      }
    }
  },
  filters = {
    dotfiles = true,
    custom = { '.git', 'node_modules', '.cache', '.bin' },
  },
  git = {
    enable = true,
    ignore = true,
  },
  view = {
    width = 32,
  },
  actions = {
    open_file = {
      quit_on_open = true,
      window_picker = {
        enable = true
      }
    },
  },
  renderer = {
    indent_markers = {
      enable = true
    }
  }
}
