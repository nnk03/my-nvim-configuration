vim.o.undofile = true
require("neeraj.core")
require("neeraj.lazy")

-- for javascript files alone, setting some properties
vim.cmd([[
  autocmd FileType javascript setlocal shiftwidth=2
  autocmd FileType javascript setlocal softtabstop=2
  autocmd FileType javascript setlocal tabstop=2
  autocmd FileType javascript setlocal noexpandtab
]])

-- for shell scripts, do not expand tab
vim.cmd([[
  autocmd FileType sh setlocal noexpandtab
]])

-- Automatically build and compile LaTeX files on save
vim.cmd([[
  augroup LaTeXAutoCompile
    autocmd!
    autocmd BufWritePost *.tex :silent !pdflatex %:t
  augroup END
]])

-- to apply shfmt for shell script files
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.sh" },
  command = "silent ! shfmt -w %",
})

-- to apply clang-format when saving cpp files and arduino files
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.cpp", "*.c", "*.h", "*.ino" },
  command = "silent ! clang-format -i %",
})

-- to apply rustfmt when saving rust file
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.rs" },
  command = "silent ! rustfmt %",
})

-- to apply black formatting when saving python files
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.py" },
  command = "silent ! black %",
})

-- to enable the plugin automatically when opening markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    require("render-markdown").enable()
  end,
})

-- vim.g.mkdp_echo_preview_url = 1
