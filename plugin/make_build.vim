if !has('python')
    finish
endif

function! Make_build()
python << endPython

import vim
import os

for dirname, dirnames, filenames in os.walk('.'):
    print dirname, dirnames, filenames


endPython
endfunc

command! MakeBuild call Make_build()
