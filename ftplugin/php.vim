" PHP prettify.
function! PHP_prettify()
  execute('%! phpcbf')
endfunction

:command! P call PHP_prettify()
set shiftwidth=2
