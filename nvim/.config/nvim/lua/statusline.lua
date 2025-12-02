vim.cmd([[
  au InsertEnter * hi statusline guifg=#101010 guibg=#d7afff ctermbg=black ctermfg=magenta
  au InsertLeave * hi statusline guifg=#101010 guibg=#8fbfdc ctermbg=black ctermfg=cyan
  hi statusline                  guifg=#101010 guibg=#8fbfdc ctermbg=black ctermfg=cyan

  " Use double quotes for keys in dictionary below to find ctrl key commands accurately
  let g:currentmode={
      \ "n"      : 'Normal'   , "no"     : 'Normal·Operator Pending',
      \ "v"      : 'Visual'   , "V"      : 'V·Line'                 ,
      \ "\<C-V>" : 'V·Block'  , "s"      : 'Select'                 ,
      \ "S"      : 'S·Line'   , "\<C-S>" : 'S·Block'                ,
      \ "i"      : 'Insert'   , "R"      : 'Replace'                ,
      \ "Rv"     : 'V·Replace', "c"      : 'Command'                ,
      \ "cv"     : 'Vim Ex'   , "ce"     : 'Ex'                     ,
      \ "r"      : 'Prompt'   , "rm"     : 'More'                   ,
      \ "r?"     : 'Confirm'  , "!"      : 'Shell'                  ,
      \ "t"      : 'Terminal'
      \}
  set laststatus=2
  set statusline=

  "set statusline+=%0*\ %n\                                 " Buffer number
  set statusline+=%0*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
  set statusline+=%3*│                                     " Separator
  set statusline+=%2*\ %Y\                                 " FileType
  set statusline+=%3*│                                     " Separator

  "set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
  set statusline+=\ (%{&ff})                               " FileFormat (dos/unix..)
  set statusline+=%=                                       " Right Side
  set statusline+=%2*\ col:\ %02v\                         " Colomn number
  set statusline+=%3*│                                     " Separator
  set statusline+=%1*\ ln:\ %02l/%L\ (%3p%%)\              " Line number / total lines, percentage of document
  set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode
  hi User1 guibg=#4e4e4e guifg=#adadad ctermfg=007 ctermbg=239
  hi User2 guibg=#303030 guifg=#adadad ctermfg=007 ctermbg=236
  hi User3 guibg=#303030 guifg=#303030 ctermfg=236 ctermbg=236
  hi User4 guibg=#4e4e4e guifg=#4e4e4e ctermfg=239 ctermbg=239
]])
