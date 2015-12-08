if !has('python')
    finish
endif

function! Make_build()
    pyfile make_build.py
endfunc

command! MakeBuild call Make_build()
