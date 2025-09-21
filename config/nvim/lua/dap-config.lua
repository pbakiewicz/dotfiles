require("dap-python").setup(python)

table.insert(require("dap").configurations.python, {
  type = 'python',
  -- potencjalnie zdobac tego patha z envow?
  python = {'/home/pawel/w/django-test/.venv/bin/python3'},
  request = 'launch',
  name = 'e-matura',
  justMyCode = false,
 -- program = vim.fn.getcwd() .. '/manage.py',

  program = '/home/pawel/w/django-test/ematura/manage.py',
  args = {'runserver', '--noreload'},
})
