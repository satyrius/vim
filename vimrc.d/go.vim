let s:goroot=$GOROOT
if s:goroot == ""
    let s:goroot=substitute(system("go env GOROOT"),"\n", "", "g")
endif

if s:goroot != ""
    let &runtimepath=&runtimepath . ',' . s:goroot . "/misc/vim"
endif
