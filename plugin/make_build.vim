if !has('python')
    finish
endif
function! Make_build()
command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>
python << endPython

import vim
import os
import subprocess 

wd = vim.eval("expand('%:p:h')")
levels = wd.count('/')

if levels == 4:
    sd = wd
elif levels == 5:
    sd = os.path.abspath(os.path.join(wd, '..'))
elif levels >= 6:
    sd = os.path.abspath(os.path.join(wd, '../..'))
else:
    print("MakeBuild can't be called at workspace level or higher")

print sd

bd = ''
for dirpath, dirnames, filenames in os.walk(sd):
    if 'Makefile' in filenames:
        bd = dirpath
        break
if bd != '':
    vim.command('R make -C ' + bd + ' -j')     
else:
    print "No Makefile founded in parents dir"    
endPython
endfunc

command! MakeBuild call Make_build()
