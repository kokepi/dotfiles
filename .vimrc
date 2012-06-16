" ##### Keybords #####
set t_ku=OA
set t_kd=OB
set t_kl=OD
set t_kr=OC
set t_kb=
set t_kD=[3~

" ##### Views #####
set number
syntax on
filetype on
filetype indent on
filetype plugin on
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
hi Comment ctermfg=lightgray

" ##### Search in regex #####
nnoremap / /\v
cnoremap s/ s/\v


" ##### Skelton for html #####
augroup SkeletonAu
    autocmd!
    autocmd BufNewFile *.html 0r $HOME/.vim/templates/skelton.html
augroup END


" ##### Plugins #####
" neocomplcache
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化
let g:neocomplcache_force_overwrite_completefunc = 1
" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" ##### Auto mkdir #####
augroup vimrc-auto-mkdir  " {{{
       	autocmd!
      	autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
       	function! s:auto_mkdir(dir, force)  " {{{
	       	if !isdirectory(a:dir) && (a:force ||
				       	\    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
		       	call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
	       	endif
       	endfunction  " }}}
augroup END  " }}}

" ##### Sorround vim #####
autocmd FileType html,eruby let b:surround_49  = "<h1>\r</h1>"
autocmd FileType html,eruby let b:surround_50  = "<h2>\r</h2>"
autocmd FileType html,eruby let b:surround_51  = "<h3>\r</h3>"
autocmd FileType html,eruby let b:surround_52  = "<h4>\r</h4>"
autocmd FileType html,eruby let b:surround_53  = "<h5>\r</h5>"
autocmd FileType html,eruby let b:surround_54  = "<h6>\r</h6>"

autocmd FileType html,eruby let b:surround_112 = "<p>\r</p>"
autocmd FileType html,eruby let b:surround_117 = "<ul>\r</ul>"
autocmd FileType html,eruby let b:surround_111 = "<ol>\r</ol>"
autocmd FileType html,eruby let b:surround_108 = "<li>\r</li>"
autocmd FileType html,eruby let b:surround_97  = "<a href=\"\">\r</a>"
autocmd FileType html,eruby let b:surround_65  = "<a href=\"\r\"></a>"
autocmd FileType html,eruby let b:surround_105 = "<img src=\"\r\" alt=\"\" />"
autocmd FileType html,eruby let b:surround_73  = "<img src=\"\" alt=\"\r\" />"
autocmd FileType html,eruby let b:surround_100 = "<div>\r</div>"
autocmd FileType html,eruby let b:surround_68  = "<div class=\"section\">\r</div>"

" ##### NERDTree #####

let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
    autocmd VimEnter * execute 'NERDTree ./'
endif

