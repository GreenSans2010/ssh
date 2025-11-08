" Кодировка UTF-8
set encoding=utf8

" Отключение совместимости с vi. Нужно для правильной работы некоторых опций
set nocompatible

" Игнорировать регистр при поиске
set ignorecase

" Не игнорировать регистр, если в паттерне есть большие буквы
set smartcase

" Подсвечивать найденный паттерн
set hlsearch

" Интерактивный поиск
set incsearch

" Размер табов - 2
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Превратить табы в пробелы
set expandtab

" Таб перед строкой будет вставлять количество пробелов определённое в shiftwidth
set smarttab

" Копировать отступ на новой строке
set autoindent
set smartindent

" Показывать номера строк
set number

" Относительные номера строк
set relativenumber

" Автокомплиты в командной строке
set wildmode=longest,list

" Подсветка синтаксиса
syntax on

" Разрешить использование мыши
set mouse=a

" Использовать системный буфер обмена
set clipboard=unnamedplus

" Быстрый скроллинг
set ttyfast

" Курсор во время скроллинга будет всегда в середине экрана
set so=30

" Встроенный плагин для распознавания отступов
filetype plugin indent on

" ====================
" ЦВЕТОВАЯ СХЕМА ДЛЯ ТЕРМИНАЛА
" ====================
" Основные цвета
highlight Normal ctermfg=255 ctermbg=234
highlight Cursor ctermfg=0 ctermbg=255
highlight Visual ctermfg=0 ctermbg=110

" Выделение текста
highlight Search ctermfg=0 ctermbg=30

" Синтаксические группы
highlight Comment ctermfg=130
highlight Constant ctermfg=125
highlight Identifier ctermfg=30
highlight Statement ctermfg=255
highlight PreProc ctermfg=255
highlight Type ctermfg=167
highlight Special ctermfg=110

" Номера строк
highlight LineNr ctermfg=130
highlight CursorLineNr ctermfg=255

" Статусная строка
highlight StatusLine ctermfg=234 ctermbg=110
highlight StatusLineNC ctermfg=239 ctermbg=24

" Меню автодополнения
highlight Pmenu ctermfg=255 ctermbg=239
highlight PmenuSel ctermfg=0 ctermbg=110
highlight PmenuSbar ctermbg=24
highlight PmenuThumb ctermbg=110

" Ошибки и предупреждения
highlight ErrorMsg ctermfg=167
highlight WarningMsg ctermfg=167

" Прочие элементы
highlight Todo ctermfg=125
highlight MatchParen ctermbg=30

" ====================
" ОБВОДКА ДЛЯ PANEL АВТОДОПОЛНЕНИЯ
" ====================
highlight Pmenu ctermfg=255 ctermbg=236
highlight PmenuSel ctermfg=234 ctermbg=110
highlight PmenuSbar ctermbg=237
highlight PmenuThumb ctermbg=110

" Группы COC.NVIM для подсказок
highlight CocMenuSel ctermfg=234 ctermbg=110

" Подсветка текущего элемента в автодополнении
highlight CocSearch ctermfg=110
highlight CocCursorRange ctermbg=30

" Вспомогательные элементы COC
highlight CocErrorFloat ctermfg=167 ctermbg=236
highlight CocWarningFloat ctermfg=130 ctermbg=236
highlight CocInfoFloat ctermfg=110 ctermbg=236
highlight CocHintFloat ctermfg=125 ctermbg=236

" Подсветка символа под курсором
highlight CocUnderline cterm=underline
highlight CocErrorHighlight cterm=undercurl
highlight CocWarningHighlight cterm=undercurl
highlight CocInfoHighlight cterm=undercurl
highlight CocHintHighlight cterm=undercurl

" Выделение текущей строки
highlight CocHighlightText ctermbg=237

" Значки на полях (gutter)
highlight CocErrorSign ctermfg=167
highlight CocWarningSign ctermfg=130
highlight CocInfoSign ctermfg=110
highlight CocHintSign ctermfg=125

" ====================
" ДОПОЛНИТЕЛЬНЫЕ НАСТРОЙКИ
" ====================

" Подсветка текущей строки
set cursorline
highlight CursorLine ctermbg=236
highlight CursorLineNr ctermfg=110 ctermbg=236

" Цвета для строки состояния
highlight StatusLine ctermfg=255 ctermbg=236
highlight StatusLineNC ctermfg=239 ctermbg=236

" Границы окон
highlight WinSeparator ctermfg=30

" Выделение выбранного текста
highlight Visual ctermfg=NONE ctermbg=237

" Поиск
highlight Search ctermfg=234 ctermbg=110

" Настройки COC
let g:coc_disable_transparent_cursor = 1

" ====================
" ПЛАГИНЫ
" ====================

call plug#begin("~/.vim/plugged")
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim'
Plug 'akinsho/toggleterm.nvim'
call plug#end()

" ====================
" НАСТРОЙКИ ПЛАГИНОВ
" ====================

" TOGGLETERM
lua << EOF
require("toggleterm").setup({
  open_mapping = [[<c-\>]],
  direction = 'horizontal',
  size = 15,
})
EOF

" AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline_statusline_ontop=0
let g:airline#extensions#tabline#formatter = 'default'

" NERDTREE
" Автоматическое открытие NERDTree ТОЛЬКО при запуске без файлов
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | wincmd p | endif

" Включить/выключить NERDTree при нажатии \n
nnoremap <leader>n :NERDTreeToggle<CR>

" Показывает количество строк в файлах
let g:NERDTreeFileLines = 1

" Игнорировать указанные папки
let g:NERDTreeIgnore = ['^node_modules$', '^__pycache__$']

" Закрыть vim, если единственная вкладка - это NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" COC.NVIM
" Автокомплиты через Tab
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"

" ====================
" ФИНАЛЬНЫЕ НАСТРОЙКИ
" ====================

" Улучшенная поддержка мыши
set mouse=nvci

" Улучшенное поведение скроллинга
set scrolloff=8
set sidescrolloff=8

" Улучшенное копирование
set clipboard^=unnamed,unnamedplus

" Улучшенное управление буферами
set hidden
