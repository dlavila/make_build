if !has('python')
    finish
endif
function! Make_build()
python << endPython

import vim
import os

wd = vim.eval("expand('%:p:h')")
levels = wd.count('/')

if levels == 3:
    sd = wd
elif levels == 4:
    sd = os.path.abspath(os.path.join(wd, '..'))
elif levels >= 5:
    sd = os.path.abspath(os.path.join(wd, '../..'))
else:
    print("MakeBuild can't be called at $HOME level or higher")

print wd
print sd

for dirpath, dirnames, filenames in os.walk(sd):
    if 'MakeFile' in filenames:

print wd

endPython
endfunc

command! MakeBuild call Make_build()
