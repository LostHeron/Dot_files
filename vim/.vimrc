"echo ">^.^<"
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" DEFAULT VIMRC OPTION : 

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Bail out if something that ran earlier, e.g. a system wide vimrc, does not
" want Vim to use these default values.
if exists('skip_defaults_vim')
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Avoid side effects when it was already reset.
if &compatible
  set nocompatible
endif

" When the +eval feature is missing, the set command above will be skipped.
" Use a trick to reset compatible only when the +eval feature is missing.
silent! while 0
  set nocompatible
silent! endwhile

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set history=200		" keep 200 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set wildmenu		" display completion matches in a status line

" Show @@@ in the last line if it is truncated.
set display=truncate

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries.
if has('win32')
  set guioptions-=t
endif

" Don't use Q for Ex mode, use it for formatting.  Except for Select mode.
" Revert with ":unmap Q".
map Q gq
sunmap Q

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>


" Only do this part when Vim was compiled with the +eval feature.
if 1

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " Revert with ":filetype off".
  filetype plugin indent on

  " Put these in an autocmd group, so that you can revert them with:
  " ":autocmd! vimStartup"
  augroup vimStartup
    autocmd!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim), for a commit or rebase message
    " (likely a different one than last time), and when using xxd(1) to filter
    " and edit binary files (it transforms input files back and forth, causing
    " them to have dual nature, so to speak)
    autocmd BufReadPost *
      \ let line = line("'\"")
      \ | if line >= 1 && line <= line("$") && &filetype !~# 'commit'
      \      && index(['xxd', 'gitrebase'], &filetype) == -1
      \ |   execute "normal! g`\""
      \ | endif

  augroup END

  " Quite a few people accidentally type "q:" instead of ":q" and get confused
  " by the command line window.  Give a hint about how to get out.
  " If you don't like this you can put this in your vimrc:
  " ":autocmd! vimHints"
  augroup vimHints
    au!
    autocmd CmdwinEnter *
	  \ echohl Todo |
	  \ echo gettext('You discovered the command-line window! You can close it with ":q".') |
	  \ echohl None
  augroup END

endif


" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
  syntax on

  " I like highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If set (default), this may break plugins (but it's backward
  " compatible).
  set nolangremap
endif





" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" MY ADDING 

" MY MUST : 
set number
set relativenumber
set splitright
set splitbelow
set tabstop=4
set shiftwidth=4 " make auto indent to be one indent !
set hls
set ignorecase
set smartcase
set clipboard="unnamed" " does not work because do not have +X11 vim compile version
set clipboard="unnamedplus" " does not work because do not have +X11 vim compile version

" change leader key
let mapleader = " "
let localmapleader = " "

" remove old leader key behaviour
nnoremap <Space> <Nop>
nnoremap <Space> <Nop>

"add from github Hendrikim/dotfiles
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>

" use leader + e to open some kind of tree !
nnoremap <leader>e <cmd>Lex<CR>

" allow to indent several times in visual mod :
vnoremap > >gv
vnoremap < <gv

" allow <C-b> and <C-f> to move back and forth in cmd mode and insert mode
cnoremap <C-b> <left>
cnoremap <C-f> <right>
inoremap <C-b> <left>
inoremap <C-f> <right>

" test for C-P to behave like UP in cmd mode and insert mode (same for C-N with down)
cnoremap <C-p> <up>
cnoremap <C-n> <down>
" inoremap <C-p> <up>
" inoremap <C-n> <down>

" do not copy what was replaced in visual mod :
" WARNING : behaviour problem when copying until an end of line 
" add a space at the end of line to counter 
vnoremap p "_dP

" clear last searched pattern when pressing <Esc> in normal mode 
" but commented cuz not working right
" nnoremap <Esc> <Esc><cmd>let @/ = ""<CR>

" on va remplacer apres les : :char est tu la ? 

" OHTER  
" to make <C-a> increase next number
" no more need to be on it, it will go to next number it encounters
function! AddSubtract(char, back)
  let pattern = &nrformats =~ 'alpha' ? '[[:alpha:][:digit:]]' : '[[:digit:]]'
  call search(pattern, 'cw' . a:back)
  execute 'normal! ' . v:count1 . a:char
  silent! call repeat#set(":\<C-u>call AddSubtract('" .a:char. "', '" .a:back. "')\<CR>")
endfunction
nnoremap <silent>         <C-a> :<C-u>call AddSubtract("\<C-a>", '')<CR>
nnoremap <silent> <Leader><C-a> :<C-u>call AddSubtract("\<C-a>", 'b')<CR>
nnoremap <silent>         <C-x> :<C-u>call AddSubtract("\<C-x>", '')<CR>
nnoremap <silent> <Leader><C-x> :<C-u>call AddSubtract("\<C-x>", 'b')<CR>

" to keep folding in memory 
" OLD VERSION : 
" augroup remember_folds
" 	autocmd!
" 	autocmd BufWinLeave * mkview
" 	autocmd BufWinEnter * silent! loadview
" augroup END
" NEW VERSION :
augroup AutoSaveGroup
	autocmd!
	" view files are about 500 bytes
	" bufleave but not bufwinleave captures clasing 2nd tab
	" nested is needed by bufwrite* (if triggered via other autocmd)
	" bufhidden for compatibility with 'set hidden'
	autocmd BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre ?* nested silent! mkview!
	autocmd BufWinEnter ?* silent! loadview
augroup end
" A guy said he was also using these two but i do not understand :
" set viewoptions=fold,cursor
" set sessionoptions=folds

" mean trigger command 'source $MYVIMRC' when $MYVIMRC is saved (with
" burwritepost $MYVIMRC) and autocmd to say do that automatically each time
" your save $MYVIMRC file !
" autocmd bufwritepost $MYVIMRC source $MYVIMRC
inoremap <C-g> <
inoremap <C-j> >
