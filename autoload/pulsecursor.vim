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
