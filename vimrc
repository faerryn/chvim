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
let s:choices = ''
let s:i = 1
for s:profile in s:profiles
	let s:choices = s:choices .. '&' .. s:i .. s:profile .. "\n"
	let s:i = s:i + 1
endfor
execute 'source' s:profiles[confirm('', s:choices) - 1]
