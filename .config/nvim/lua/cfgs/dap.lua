-- All DAP setups

local masonInstallPath = os.getenv('HOME') .. "/.local/share/nvim/mason/bin/"
local dap = require('dap')

dap.adapters.codelldb = {
  type = "server",
  port = 32323,
  executable = {
    command = masonInstallPath .. "codelldb",
    args = {"--port", "${port}"}
  }
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  }
}

-- UI setup
local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
