vim.opt.guicursor = ""
vim.opt.path:append("**")
vim.opt.wildmenu = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true
vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.errorbells = false
vim.opt.showmatch = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"
vim.opt.cmdheight = 2
vim.opt.updatetime = 50
vim.opt.ttimeoutlen = 50
vim.opt.shortmess:append("c")
vim.opt.termguicolors = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.undodir = os.getenv("HOME") .. "/.cache/.vimdid"
vim.opt.undofile = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.colorcolumn = "100"
vim.opt.showmode = false
vim.opt.laststatus = 2
vim.opt.mouse = "a"
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
vim.g.dracula_colorterm = 0
vim.cmd("colorscheme dracula")
vim.g.mapleader = "\\"
vim.g.Illuminate_delay = 100

vim.cmd([[
    augroup FormatAutogroup
        autocmd!
        autocmd BufWritePost * silent FormatWrite
    augroup END
]])
