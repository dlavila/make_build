if !has('python')
    finish
endif

function! Make_build()
python << endPython

print "hello world!!"

endPython
endfunc

command! MakeBuild call Make_build()
