vim.cmd([[
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
  
  function! StatusLineSetColor()
    let s=""
    if(mode()=="i")
      let s.="%#hlInsert#"
    elseif(mode()=="R" || mode()=="Rv")
      let s.="%#hlReplace#"
    elseif(mode()=="v" || mode()=="V" || mode()=="\<C-v>")
      let s.="%#hlVisual#"
    else
      let s.="%#hlNormal#"
    end
    return s
  endfunction
  
  function! StatusLineWrite()
    let s=""
    let s.=StatusLineSetColor()
    "let s.=" %n "
    let s.=" %<%F%m%r%h%w "
    let s.="%#hlPadding# "
    let s.="%#hlMiddle# %Y "
    let s.="%#hlPadding# "
    let s.=" (%{&ff})%="
    let s.="%#hlMiddle# col: %02v "
    let s.="%#hlPadding# "
    let s.="%#hlRowInfo# ln: %02l/%L (%3p%%) "
    let s.=StatusLineSetColor()
    let s.=" %{toupper(g:currentmode[mode()])} "
    return s
  endfunction
  
  set laststatus=2
  set statusline=%!StatusLineWrite()
  
  hi hlRowInfo ctermfg=007 ctermbg=239 guifg=#c0c0c0 guibg=#4e4e4e
  hi hlMiddle  ctermfg=007 ctermbg=236 guifg=#c0c0c0 guibg=#303030
  hi hlPadding ctermfg=236 ctermbg=236 guifg=#303030 guibg=#303030
  hi hlNormal  ctermfg=232 ctermbg=014 guifg=#080808 guibg=#00ffff
  hi hlInsert  ctermfg=232 ctermbg=013 guifg=#080808 guibg=#ff00ff
  hi hlVisual  ctermfg=232 ctermbg=012 guifg=#080808 guibg=#005fff
  hi hlReplace ctermfg=232 ctermbg=011 guifg=#080808 guibg=#ffff00
]])
