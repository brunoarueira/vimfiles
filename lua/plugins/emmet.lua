return {
  "mattn/emmet-vim",
  config = function()
    vim.cmd [[
      let g:user_emmet_install_global = 0

      autocmd FileType html,css EmmetInstall

      let g:user_emmet_leader_key='<leader>'
      let g:user_emmet_settings = {
      \  'javascript.jsx' : {
      \      'extends': 'jsx',
      \      'quote_char': "'",
      \  },
      \}
    ]]
  end,
}
