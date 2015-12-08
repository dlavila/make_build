if !has('python')
    finish
endif

function! make_build()
    pyfile make_build.py
endfunc

command! MakeBuild call MakeBuild()
