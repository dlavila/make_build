if !has('python')
    finish
endif

function! Make_build()
python << endPython

import vim
import os

wd = vim.eval("expand('%:p:h')")

[print x[0] for x in os.walk(wd)]

print wd

endPython
endfunc

command! MakeBuild call Make_build()
