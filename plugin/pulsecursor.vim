command! PulseCursor call pulsecursor#pulse()

augroup pulse_cursor_on_focus
    autocmd!
    autocmd FocusGained * call pulsecursor#register()
augroup end
