if !has('python')
    finish
endif

function! Make_build()
python << endPython

import vim

folders = vim.eval('echo globpath('.','*')')

print folders
endPython
endfunc

command! MakeBuild call Make_build()
