if !has('python')
    finish
endif
function! Make_build()
python << endPython

import vim
import os

wd = vim.eval("expand('%:p:h')")
wd_par = os.path.abspath(os.path.join(wd, os.pardir))
print [x[0] for x in os.walk(wd_par)]

print wd

endPython
endfunc

command! MakeBuild call Make_build()
