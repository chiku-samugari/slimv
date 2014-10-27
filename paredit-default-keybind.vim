imap <buffer> ( <Plug>(PareditInsertOpeningParen)
imap <buffer> ) <Plug>(PareditInsertClosingParen)
imap <buffer> " <Plug>(PareditInsertQuotes)
imap <buffer> <BS> <Plug>(PareditBackspace)
imap <buffer> <Del> <Plug>(PareditDel)
if &ft =~ '.*\(clojure\|scheme\|racket\).*' && g:paredit_smartjump
    nmap <buffer> ( <Plug>(PareditSmartJumpOpening0)
    nmap <buffer> ) <Plug>(PareditSmartJumpClosing0)
    vmap <buffer> ( <Plug>(PareditSmartJumpOpening1)
    vmap <buffer> ) <Plug>(PareditSmartJumpClosing1)
else
    nmap <buffer> ( <Plug>(PareditFindOpening0)
    nmap <buffer> ) <Plug>(PareditFindClosing0)
    vmap <buffer> ( <Plug>(PareditFindOpening1)
    vmap <buffer> ) <Plug>(PareditFindClosing1)
endif
nmap <buffer> [[ <Plug>(PareditFindDefunBck)
nmap <buffer> ]] <Plug>(PareditFindDefunFwd)
nmap <buffer> x <Plug>(PareditEraseFwdRepeatable)
nmap <buffer> <Del> <Plug>(PareditEraseFwd)
nmap <buffer> X <Plug>(PareditEraseBckRepeatable)
nmap <buffer> s <Plug>(PareditEraseFwdI)
nmap <buffer> D <Plug>(PareditDeleteRepeatable)
nmap <buffer> C <Plug>(PareditChange1)
nmap <buffer> d <Plug>(PareditSetDelete)
vmap <buffer> d <Plug>(PareditVDelete)
vmap <buffer> x <Plug>(PareditVDelete)
vmap <buffer> <Del> <Plug>(PareditVDelete)
nmap <buffer> c <Plug>(PareditChangeg40)
vmap <buffer> c <Plug>(PareditChangeV1)
nmap <buffer> dd <Plug>(PareditDeleteRepeatable)
nmap <buffer> cc <Plug>(PareditChangeLines)
nmap <buffer> cw <Plug>(PareditChangeSpeccw)
nmap <buffer> cW <Plug>(PareditChangeg40E)
nmap <buffer> cb <Plug>(PareditChangeSpeccb)
nmap <buffer> ciw <Plug>(PareditChangeSpecciw)
nmap <buffer> caw <Plug>(PareditChangeSpeccaw)
nmap <buffer> p <Plug>(PareditPutRepeatablep)
nmap <buffer> P <Plug>(PareditPutRepeatableP)
execute 'nmap <buffer> ' .  g:paredit_leader . 'w( <Plug>(PareditWrapRepeatable)'
execute 'vmap <buffer> ' .  g:paredit_leader . 'w( <Plug>(PareditWrapSelection)'
execute 'nmap <buffer> ' .  g:paredit_leader . 'w" <Plug>(PareditWrapDQRepeatable)'
execute 'vmap <buffer> ' .  g:paredit_leader . 'w" <Plug>(PareditWrapDQSelection)'

execute 'nmap <buffer> <silent> ' . g:paredit_leader. '<Up> <Plug>(PareditSplit)'
execute 'nmap <buffer> <silent> ' . g:paredit_leader. '<Down>  <Plug>(PareditJoin)'
execute 'nmap <buffer> ' . g:paredit_leader . 'I <Plug>(PareditRaiseRepeatable)'

if &ft =~ '.*\(clojure\|scheme\|racket\).*'
    imap <buffer> [ <Plug>(PareditInsertOpeningBracket)
    imap <buffer> ] <Plug>(PareditInsertClosingBracket)
    imap <buffer> { <Plug>(PareditInsertOpeningBrace)
    imap <buffer> } <Plug>(PareditInsertClosingBrace)
    execute 'nmap <buffer> ' . g:paredit_leader . 'w[ <Plug>(PareditWrapBracketRepeatable)'
    execute 'vmap <buffer> ' . g:paredit_leader . 'w[ <Plug>(PareditWrapBracketSelection)'
    execute 'nmap <buffer> ' . g:paredit_leader . 'w{ <Plug>(PareditWrapBraceRepeatable)'
    execute 'vmap <buffer> ' . g:paredit_leader . 'w{ <Plug>(PareditWrapBraceSelection)'
endif

if g:paredit_shortmaps
    " Shorter keymaps: old functionality of KEY is remapped to <Leader>KEY
    nmap <buffer> < <Plug>(PareditMoveLeft)
    nmap <buffer> > <Plug>(PareditMoveRight)
    nmap <buffer> O <Plug>(PareditSplit)
    nmap <buffer> J <Plug>(PareditJoin)
    nmap <buffer> W <Plug>(PareditWrapRepeatable)
    vmap <buffer> W <Plug>(PareditWrapSelection)
    nmap <buffer> S <Plug>(PareditSplice)
    execute 'nnoremap <buffer> <silent> ' . g:paredit_leader.'O  :<C-U>normal! O<CR>'
    execute 'nnoremap <buffer> <silent> ' . g:paredit_leader.'J  :<C-U>normal! J<CR>'
    execute 'nnoremap <buffer> <silent> ' . g:paredit_leader.'W  :<C-U>normal! W<CR>'
    execute 'vnoremap <buffer> <silent> ' . g:paredit_leader.'W  :<C-U>normal! W<CR>'
    execute 'nnoremap <buffer> <silent> ' . g:paredit_leader.'S  :<C-U>normal! S<CR>'
else
    " Longer keymaps with <Leader> prefix
    nnoremap <buffer> <silent> S            V:<C-U>call PareditChange(visualmode(),1)<CR>
    execute 'nmap <buffer> ' .  g:paredit_leader . '< <Plug>(PareditMoveLeft)'
    execute 'nmap <buffer> ' .  g:paredit_leader . '> <Plug>(PareditMoveRight)'
    execute 'nmap <buffer> ' .  g:paredit_leader . 'O <Plug>(PareditSplit)'
    execute 'nmap <buffer> ' .  g:paredit_leader . 'J <Plug>(PareditJoin)'
    execute 'nmap <buffer> ' .  g:paredit_leader . 'W <Plug>(PareditWrapRepeatable)'
    execute 'vmap <buffer> ' .  g:paredit_leader . 'W <Plug>(PareditWrapSelection)'
    execute 'vmap <buffer> ' .  g:paredit_leader . 'S <Plug>(PareditSplice)'
endif
