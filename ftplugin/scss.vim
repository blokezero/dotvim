
" ---- SCSS ----
function! Scss_comp()
  " Get the output from sass compiler, attempt to write css to css folder
  " above.
  let out = system('sassc ' . shellescape( expand('%:p') ) . ' ' . fnamemodify(expand('%:r'), ':s?scss?css?:p') . '.css')
  if out == ''
    echo 'Compiled to ' . fnamemodify(expand('%:r'), ':s?scss?css?:p') . '.css'
  else
    echo out
  endif
  "call setqflist(out)
endfunction

:command! S call Scss_comp()


function! Scss_prettify()
  " Get the output from sass compiler, attempt to write css to css folder
  " above.
  let out = execute('%! sass-convert')
  if out == ''
    echo 'Compiled to ' . expand('%:p')
  "else
    "echo out
  endif
  "call setqflist(out)
endfunction

:command! P call Scss_prettify()
