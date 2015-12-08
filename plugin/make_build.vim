if !has('python')
    finish
endif

function! Make_build()
python << endPython

import vim

folders = vim.eval("expand('%:p:h')")

print folders

endPython
endfunc

command! MakeBuild call Make_build()
