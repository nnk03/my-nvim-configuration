-- enables undofile
vim.o.undofile = true

-- set mapleader before loading lazy
vim.g.mapleader = " "

-- contains the keymaps and options
require("neeraj.core")

-- contains plugins, lsp
require("neeraj.lazy")

--
-- local plugins = {}
-- local opts = {}

require("neeraj.autocmd")
