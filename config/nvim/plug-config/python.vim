"For python 
set fdm=indent
set nofoldenable
imap <C-b> import pudb; pu.db
imap <C-v> from blackfire import probe; probe.initialize(); probe.enable()
"autocmd BufWritePost *.py call Flake8() "flake8 on save


2mat ErrorMsg '\%119v.' "highlights 81st char
