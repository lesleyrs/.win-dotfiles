vim.opt.number = true
vim.opt.relativenumber = true

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'c',
  callback = function(args)
    vim.lsp.start({
      name = 'clangd',
      cmd = {'clangd'},
      -- root_dir = vim.fs.root(args.buf, {'setup.py', 'pyproject.toml'}),
    })
  end,
})
