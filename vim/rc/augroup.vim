" displays current line in current window while in InsertMode
augroup CursorLine
    au!
    au VimEnter,BufWinEnter,WinEnter * setlocal cursorline
    au BufWinLeave * setlocal nocursorline
    nohl
augroup End

