local status, lualine = pcall(require, 'lualine')

if (not status) then
  return
end

require('brunoarueira.helpers')

local icons = require('brunoarueira.icons')
local colors = require('brunoarueira.colors')

local theme = {
  normal = {
    a = { fg = colors.black, bg = colors.off_blue },
    b = { fg = colors.off_blue, bg = colors.black },
    c = { fg = colors.off_blue, bg = colors.black },
    z = { fg = colors.off_blue, bg = colors.black },
  },

  insert = {
    a = { fg = colors.black, bg = colors.off_blue },
    z = { fg = colors.off_blue, bg = colors.black }
  },
  visual = { a = { fg = colors.black, bg = colors.off_blue } },
  replace = {
    a = { fg = colors.black, bg = colors.red },
    z = { fg = colors.black, bg = colors.red }
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
    lualine_a = { { 'mode', fmt = function(res) return res:sub(1, 1) end } },
    lualine_b = { { 'filename', file_status = true, path = 0 } },
    lualine_c = {
      {
        'branch',
        color = function()
          local gs = git_status()

          if gs == 'd' then
            return { fg = colors.teal }
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
