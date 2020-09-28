let s:profiles_f = expand('~/.vim-profiles')
if !filereadable(s:profiles_f)
	echoerr '~/.vim-profiles not found!'
	finish
endif
let s:profiles = []
for s:profile in readfile(s:profiles_f)
	if filereadable(expand(s:profile))
		call add(s:profiles, s:profile)
	endif
endfor
execute 'source' s:profiles[confirm('Run', join(s:profiles, "\n")) - 1]
