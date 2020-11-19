""""STATUS LINE""""

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


function! ModeCurrent() abort
    hi! User1 guibg=#4CA585 guifg=#D9BB80 
    if (mode() =~# '\v(n|no)')
      hi! User1 guibg=#4CA585 guifg=#D9BB80
    endif
    if (mode() =~# 'v' || mode() =~# '\v(v|V)' || mode() =~# "\<C-v>" || g:currentmode[mode()] =~# 'V·B ' || get(g:currentmode, mode(), '') =~# 't')
      hi! User1 guibg=#D9BB80 guifg=#1D2A30
    endif
    if (mode() =~# 'i')
      hi! User1 guibg=#CF7357 guifg=#D9BB80 
    endif

    let l:modecurrent = mode()
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·B '))
    let l:current_status_mode = l:modelist

    return l:current_status_mode
endfunction

function! SetStatusLine()
  if &previewwindow | return | endif
  if s:IsTempFile() | return | endif
  setl statusline=%!MyStatusLine()
	hi User1 guibg=#4CA585
	hi User2 guibg=#497C6C
	hi User3 guibg=#58659A
	hi User4 guibg=#CF7357
	hi User5 guibg=#D9BB80 guifg=#1D2A30
endfunction

function! MyStatusLine()
	return s:GetPaste()
				\. "%4*[%n]%*"
        \. "%1*%{ModeCurrent()}%*"
				\. "%5*%{MyStatusGit()}%*"
        \. "%4*%{MyStatusGitChanges()}%*"
        \. "%3* ❯❯ %t %{FileSize()}%*"
				\. "%3* %{MyStatusCoc()}%*"
				\. "%3*%{get(b:, 'coc_current_function', '')}%*"
				\. "%4*%{MyStatusReadonly()}%*"
				\. "%3*%=%*"
				\. "%5*%y%*"
				\. "%2* %l:%L::%c %P %*"
				\. "%4*%m%h%r%*"
				\. "%3*%{get(b:, 'coc_git_blame', '')} %*"
	"%{&fenc}
endfunction

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

function! s:GetPaste()
  if !&paste | return '' |endif
  return "%#MyStatusPaste# paste %*"
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

augroup statusline
  autocmd!
  autocmd BufEnter,BufNewFile,BufReadPost,ShellCmdPost,BufWritePost * call SetStatusLine()
  autocmd FileChangedShellPost,ColorScheme * call SetStatusLine()
augroup end
