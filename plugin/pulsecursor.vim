command! PulseCursor call pulsecursor#pulse()

augroup pulse_cursor_on_focus
    autocmd!
    autocmd FocusGained * PulseCursor
augroup end

nnoremap <leader>pc :PulseCursor<cr>
