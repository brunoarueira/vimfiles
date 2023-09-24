local status, lualine = pcall(require, 'lualine')

if (not status) then
  return
end

require('brunoarueira.helpers')

local icons = require('brunoarueira.icons')

local colors = {
  grey = '#2E3440',
  grey_two = '#3B4252',
  grey_three = '#434C5E',
  grey_four = '#4C566A',
  grey_five = '#616E88',
  grey_six = '#D8DEE9',
  ice = '#E5E9F0',
  ice_two = '#ECEFF4',
  alternative_green = '#8FBCBB',
  cyan = '#88C0D0',
  blue = '#81A1C1',
  blue_two = '#5E81AC',
  red = '#BF616A',
  orange = '#D08770',
  yellow = '#EBCB8B',
  light_green = '#A3BE8C',
  pink = '#B48EAD'
}
local theme = {
  normal = {
    a = { fg = colors.grey, bg = colors.cyan },
    b = { fg = colors.cyan, bg = colors.grey },
    c = { fg = colors.cyan, bg = colors.grey },
    z = { fg = colors.cyan, bg = colors.grey },
  },

  insert = {
    a = { fg = colors.grey, bg = colors.cyan },
    z = { fg = colors.cyan, bg = colors.grey }
  },
  visual = { a = { fg = colors.grey, bg = colors.cyan } },
  replace = {
    a = { fg = colors.grey, bg = colors.red },
    z = { fg = colors.grey, bg = colors.red }
  }
}

lualine.setup({
  options = {
    theme = theme,
    icons_enabled = true,
    component_separators = '',
    section_separators = { left = '', right = '' },
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = { { 'mode', fmt = function(res) return res:sub(1,1) end } },
    lualine_b = { { 'filename', file_status = true, path = 0 } },
    lualine_c = {
      {
        'branch',
        color = function()
          local gs = git_status()

          if gs == 'd' then
            return { fg = colors.cyan }
          elseif gs == 'm' then
            return { fg = colors.red }
          end
        end
      },
    },
    lualine_x = {
      {
        'diagnostics',
        sources = {
          'nvim_diagnostic'
        },
        symbols = icons
      },
      'encoding',
      'filetype'
    },
    lualine_y = {
      {
        'fileformat',
        icons_enabled = true
      }
    },
    lualine_z = { { 'location', padding = { left = 0 } } }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        'filename',
        file_status = true,
        path = 1
      }
    },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {}
})
