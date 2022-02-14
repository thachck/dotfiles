----------------------------------------------------------
-- Statusline configuration file
-----------------------------------------------------------

-- Plugin: feline.nvim
-- url: https://github.com/famiu/feline.nvim

--- For the configuration see the Usage section:
--- https://github.com/famiu/feline.nvim/blob/master/USAGE.md

--- Thanks to ibhagwan for the example to follow:
--- https://github.com/ibhagwan/nvim-lua


local colors = require('colors').monokai

-- Monokai (classic) theme
local vi_mode_colors = {
  NORMAL = colors.cyan,
  INSERT = colors.green,
  VISUAL = colors.yellow,
  OP = colors.cyan,
  BLOCK = colors.cyan,
  REPLACE = colors.red,
  ['V-REPLACE'] = colors.red,
  ENTER = colors.orange,
  MORE = colors.orange,
  SELECT = colors.yellow,
  COMMAND = colors.pink,
  SHELL = colors.pink,
  TERM = colors.pink,
  NONE = colors.purple
}

local lsp = require 'feline.providers.lsp'
local vi_mode_utils = require 'feline.providers.vi_mode'

local lsp_get_diag = function(str)
  local count = vim.lsp,diagnostic.get_count(0, str)
  return (count > 0) and ' '..count..' ' or ''
end

-- My components
local comps = {
  -- vi_mode -> NORMAL, INSERT..
  vi_mode = {
    left = {
      provider = function()
        local label = ' '..vi_mode_utils.get_vim_mode()..' '
        return label
      end,
      hl = function()
        local set_color = {
          name = vi_mode_utils.get_mode_highlight_name(),
          fg = colors.bg,
          bg = vi_mode_utils.get_mode_color(),
          style = 'bold'
        }
        return set_color
      end,
      left_sep = ' ',
      right_sep = ' '
    }
  },
  -- Parse file information:
  file = {
    -- File name
    info = {
      provider = {
        name = 'file_info',
        opts = {
          type = 'relative',
          file_modified_icon = ''
        }
      },
      hl = { fg = colors.cyan },
      icon = '',
    },
    -- File type
    type = {
      provider = { name = 'file_type' },
    },
    -- Line-column
    position = {
      provider = { name = 'position' },
      hl = {
        fg = colors.fg,
        style = 'bold',
      },
      left_sep = ' ',
      right_sep = ' ',
    },
    -- Cursor position in %
    line_percentage = {
      provider = { name = 'line_percentage' },
      hl = {
        fg = colors.bg,
        bg = colors.cyan,
        style = 'bold',
      },
      left_sep = ' ',
      right_sep = ' '
    },
    -- Simple scrollbar
    scroll_bar = {
      provider = { name = 'scroll_bar' },
      hl = { fg = colors.fg },
      left_sep = ' ',
      right_sep = ' '
    },
  },
}

-- Get active/inactive components
--- see: https://github.com/famiu/feline.nvim/blob/master/USAGE.md#components
local components = {
  active = {},
  inactive = {},
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})

-- Right section
table.insert(components.active[1], comps.vi_mode.left)
table.insert(components.active[1], comps.file.info)
table.insert(components.inactive[1], comps.file.info)

-- Left Section
table.insert(components.active[2], comps.file.position)
table.insert(components.active[2], comps.file.line_percentage)

-- Call feline
require('feline').setup {
  theme = {
    bg = colors.bg,
    fg = colors.fg
  },
  components = components,
  vi_mode_colors = vi_mode_colors,
  force_inactive = {
    filetypes = {
      'NvimTree',
      'vista',
      'term'
    },
    buftypes = {},
    bufnames = {},
  },
}
