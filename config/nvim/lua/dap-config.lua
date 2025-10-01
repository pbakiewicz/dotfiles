require("dap-python").setup(python)


local dap = require("dap")

-- keymaps
local k = vim.keymap.set

k("n", "<space>b", dap.toggle_breakpoint)
k("n", "<F1>", dap.continue)
k("n", "<F2>", dap.step_over)
k("n", "<F3>", dap.run_to_cursor)
k("n", "<F4>", dap.step_into)
k("n", "<F5>", dap.step_out)
k("n", "<F12>", dap.terminate)

-- usuniecie defaultow niepotrzebnych
dap.configurations.python = {}

-- Docker attach
table.insert(require("dap").configurations.python, {
  name = 'docker django',
  type = 'python',
  request = 'attach',
  connect = {
      host = 'localhost',
      port = 5678,
  },
  pathMappings = {
      {
          localRoot = vim.fn.getcwd(),
          remoteRoot = "/app",
      }
},
    justMyCode = false,
    django = true,
})


-- Local launch
table.insert(require("dap").configurations.python, {
    name = "Local django",
    type = "python",
    request = "launch",
    python = {"/home/pawel/projekt/.venv/bin/python3"},
    justMyCode = false,
    django = true,
    program = "/home/pawel/projekt/manage.py",
    args = {"runserver", "--noreload"},
})

