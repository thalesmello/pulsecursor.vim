let s:cursor_still = 0

function! pulsecursor#pulse()
    let cursorline_opt = &cursorline
    let cursorcolumn_opt = &cursorcolumn

    let toggle = 0

    for _ in range(4)
       let &cursorline = toggle
       let &cursorcolumn = toggle
       let toggle = !toggle
       redraw
       sleep 50m
    endfor

    let &cursorline = cursorline_opt
    let &cursorcolumn = cursorcolumn_opt
endfunction

function! pulsecursor#pulse_if_cursor_still()
    if !s:cursor_still
        return
    endif

    call pulsecursor#pulse()
endfunction

function! pulsecursor#register()
    let s:cursor_still = 1
    augroup pulse_cursor_wait
        autocmd!
        autocmd CursorMoved * let s:cursor_still = 0 | autocmd!
        autocmd CursorMovedI * let s:cursor_still = 0 | autocmd!
        autocmd CursorHold * call pulsecursor#pulse_if_cursor_still() | autocmd!
        autocmd CursorHoldI * call pulsecursor#pulse_if_cursor_still() | autocmd!
    augroup end
endfunction
