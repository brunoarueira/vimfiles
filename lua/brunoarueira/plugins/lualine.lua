require('lualine').setup({
  sections = {
    lualine_a = { { 'mode', fmt = function(res) return res:sub(1,1) end } },
    lualine_b = { 'branch', 'diff' },
    lualine_x = {
      'encoding',
      {
        'fileformat',
        icons_enabled = true,
        symbols = {
          unix = 'LF',
          dos = 'CRLF',
          mac = 'CR',
        },
      },
      'filetype'
    },
  }
})
