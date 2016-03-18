if exists(":YcmCompleter")
  " close preview when selection is made
  autocmd CompleteDone * pclose
endif
