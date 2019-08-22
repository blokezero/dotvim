" PHP prettify.
function! PHP_prettify()
  let save_pos = getpos(".")
  execute('silent %! phpcbf -q --standard=Drupal --extensions=php,module,inc,install,test,profile,theme,css,info,txt,md')
  call setpos('.', save_pos)
endfunction

:command! P call PHP_prettify()

" Set tab to 2 spaces.
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
