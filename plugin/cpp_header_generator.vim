" cpp_header_generator.vim - C++ header file generator.
"	Invoke :CppNewHeader command to print C++ hpp file skeleton to current
"	buffer.
"
" Maintainer : Povilas Balciunas<balciunas90@gmail.com>
" License : MIT

if exists("g:loaded_cpp_header_generator_plugin")
    finish
endif
let g:loaded_cpp_header_generator_plugin = 1

function Cpp_print_header_guard_skeleton()
	let l:header_guard_name = "HEADER_" . expand('%:t') . "_"
	let l:header_guard_name = toupper(l:header_guard_name)
	let l:header_guard_name = substitute(l:header_guard_name, "\\(\\.\\|-\\)", "_", "g")
	let l:str_header_guard = ["#ifndef " . l:header_guard_name,
		\"#define " . l:header_guard_name,
		\"",
		\"",
		\"",
		\"#endif /* " . l:header_guard_name . " */"]
	call setline(line("$"), l:str_header_guard)

	" Hihglights header guard name so that it could be substituted easily.
	call search(l:header_guard_name)
	call matchadd("Search", l:header_guard_name)
	normal 4gg
	startinsert
endfunction

command CppNewHeader :call Cpp_print_header_guard_skeleton()
