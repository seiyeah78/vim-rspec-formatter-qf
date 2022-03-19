if exists('g:loaded_vim_rspec_formatter')
  finish
endif
let g:loaded_vim_rspec_formatter = 1

let s:formatter_file = expand('<sfile>:p:h', 1). '/../vim_rspec_formatter.rb'
let $SPEC_OPTS .= '-r ' . s:formatter_file . ' -f VimRspecFormatter'
