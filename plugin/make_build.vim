if !has('python')
    finish
endif

function! Make_build()
python << endPython

import vim

folders = vim.eval("globpath('..','**')").splitlines()

print folders

for folder in folders:
    print "Printing new folder"
    for dirpath, dirnames, filenames in os.walk(folder):
        print dirpath, dirnames, filenames
print folders
endPython
endfunc

command! MakeBuild call Make_build()
