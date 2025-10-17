function! s:FormatGoImports()
  if &modifiable && executable('goimports')
    let l:view = winsaveview()
    silent! execute ':%!goimports'
    call winrestview(l:view)
  endif
endfunction

augroup gofmt
  autocmd!
  autocmd BufWritePre *.go call s:FormatGoImports()
augroup END
