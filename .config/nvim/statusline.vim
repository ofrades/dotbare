""""STATUS LINE""""

" Dictionary: take mode() input -> longer notation of current mode
" mode() is defined by Vim
let g:currentmode = {
      \'n' : '[N]',
      \'no' : '[N·Operator Pending]',
      \'v' : '[V]',
      \'V' : '[V·L]',
      \"\<C-v>" : '[V·B]',
      \'s' : '[S]',
      \'S': '[S·L]',
      \'^S' : '[S·B]',
      \'i' : '[I]',
      \'R' : '[R]',
      \'Rv' : '[V·R]',
      \'c' : '[C]',
      \'cv' : '[Vim Ex]',
      \'ce' : '[Ex]',
      \'r' : '[P]',
      \'rm' : '[M]',
      \'r?' : '[C]',
      \'!' : '[S]',
      \'t' : '[T]',
      \ }


" Function: return current mode
" abort -> function will abort soon as error detected
function! ModeCurrent() abort
    let l:modecurrent = mode()
    " use get() -> fails safely, since ^V doesn't seem to register
    " 3rd arg is used when return of mode() == 0, which is case with ^V
    " thus, ^V fails -> returns 0 -> replaced with 'V Block'
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·B '))
    let l:current_status_mode = l:modelist

     if (mode() =~# '\v(n|no)')
      hi User1 guibg=#4CA585
     elseif (mode() =~# '\v(v|V)' || mode() =~# "\<C-v>" || g:currentmode[mode()] ==# 'V·B ' || get(g:currentmode, mode(), '') ==# 't')
      hi User1 guibg=#D9BB80 guifg=#1D2A30
     elseif (mode() ==# 'i')
      hi User1 guibg=#CF7357
     else
      hi User1 guibg=#4CA585
     endif

    return l:current_status_mode
endfunction

set laststatus=2 " Always show a status line
set statusline=
set statusline+=%4*
set statusline+=\ %n\ 
set statusline+=%1*
set statusline+=%{ModeCurrent()}

" file name and size
set statusline+=%3*
set statusline+=\ 
set statusline+=❯❯\ 
set statusline+=%t
set statusline+=\ 
set statusline+=\ %{FileSize()}

" Coc
set statusline+=%2*
set statusline+=\ 
set statusline+=%{MyStatusCoc()}
set statusline+=%{MyStatusReadonly()}

" git
set statusline+=\ 
set statusline+=%{MyStatusGit()}
set statusline+=%{MyStatusGitChanges()}
" big space
set statusline+=%=

set statusline+=%4*
set statusline+=%m
set statusline+=%h
set statusline+=%r

set statusline+=%5*
set statusline+=\ 
set statusline+=
set statusline+=\ 
set statusline+=%l
set statusline+=:
set statusline+=%L
set statusline+=::
set statusline+=%c
set statusline+=\ 

set statusline+=%3*
set statusline+=%y

hi User1 guibg=#4CA585
hi User2 guibg=#497C6C
hi User3 guibg=#58659A
hi User4 guibg=#CF7357
hi User5 guibg=#D9BB80 guifg=#1D2A30

function! FileSize() abort
    let l:bytes = getfsize(expand('%p'))
    if (l:bytes >= 1024)
        let l:kbytes = l:bytes / 1025
    endif
    if (exists('kbytes') && l:kbytes >= 1000)
        let l:mbytes = l:kbytes / 1000
    endif
 
    if l:bytes <= 0
        return '0'
    endif
  
    if (exists('mbytes'))
        return l:mbytes . 'MB '
    elseif (exists('kbytes'))
        return l:kbytes . 'KB '
    else
        return l:bytes . 'B '
    endif
endfunction

function! s:IsTempFile()
  if !empty(&buftype) | return 1 | endif
  if &previewwindow | return 1 | endif
  let filename = expand('%:p')
  if filename =~# '^/tmp' | return 1 | endif
  if filename =~# '^fugitive:' | return 1 | endif
  return 0
endfunction

function! MyStatusReadonly()
  if !&readonly | return '' |endif
  return "  "
endfunction

function! MyStatusCoc()
  if get(g:, 'did_coc_loaded', 0)
    return coc#status()
  endif
  return ''
endfunction

function! MyStatusGitChanges() abort
  if s:IsTempFile() | return '' | endif
  return get(b:, 'coc_git_status', '')
endfunction

function! MyStatusGit(...) abort
  let status = get(g:, 'coc_git_status', '')
  return empty(status) ? '' : '  '.status.' '
endfunction


