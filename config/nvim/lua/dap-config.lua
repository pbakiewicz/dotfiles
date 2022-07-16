require("dapui").setup()
require("nvim-dap-virtual-text").setup()

require("dap-go").setup()
require('dap-python').setup()

table.insert(require("dap").configurations.python, {
  type = 'python',
  -- potencjalnie zdobac tego patha z envow?
  python = {'/home/pawel/.config/cache/pypoetry/virtualenvs/ematura-WSoEuMZR-py3.10/bin/python3'},
  request = 'launch',
  name = 'e-matura',
  justMyCode = false,
  program = vim.fn.getcwd() .. '/manage.py',
  args = {'runserver', '--noreload'},
})
