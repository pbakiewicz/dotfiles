local function setup_dap()
    require("dap-python").setup(python)

    local dap = require("dap")
    local dapui = require("dapui")
    dapui.setup()

    -- keymaps
    local k = vim.keymap.set
    k("n", "<space>b", dap.toggle_breakpoint)
    k("n", "<F1>", dap.continue)
    k("n", "<F2>", dap.step_over)
    k("n", "<F3>", dap.run_to_cursor)
    k("n", "<F4>", dap.step_into)
    k("n", "<F5>", dap.step_out)
    k("n", "<F11>", dapui.toggle)
    k("n", "<F12>", dap.terminate)

    -- Automatyczne otwieranie/zamykanie dapui.
    dap.listeners.before.attach.dapui_config = function()
        dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
    end

    -- Tutaj aby podłączał się do konkretnych debuggerów.
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
        python = { "/home/pawel/projekt/.venv/bin/python3" },
        justMyCode = false,
        django = true,
        program = "/home/pawel/projekt/manage.py",
        args = { "runserver", "--noreload" },
    })
end

return {
    { "mfussenegger/nvim-dap", config = setup_dap },
    {
        -- tutaj dodatkowy plugin zalatwiajacy od razu konfiguracje do pythona
        "mfussenegger/nvim-dap-python",
        -- Consider the mappings at
        -- https://github.com/mfussenegger/nvim-dap-python?tab=readme-ov-file#mappings
        dependencies = {
            "mfussenegger/nvim-dap",
        },
    },
    { "rcarriga/nvim-dap-ui",  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
}
