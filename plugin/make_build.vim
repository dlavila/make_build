if !has('python')
    finish
endif
function! Make_build()
new
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
    os.chdir(bd)
    out = subprocess.call(['make', '-j'])
    vim.current.buffer.append(out)
    # p = subprocess.Popen(['make', '-j'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    #while(True):
    #   retcode = p.poll()
    #   line = p.stdout.readline()
    #   vim.current.buffer.append(line)
    #   if(retcode is not None):
    #       break
else:
    print "No Makefile founded in parents dir"
        
endPython
endfunc

command! MakeBuild call Make_build()
