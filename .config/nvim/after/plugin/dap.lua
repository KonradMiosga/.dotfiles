local dap = require('dap')
local dapui = require('dapui')

dapui.setup {
  elements = {
    'scopes',
    'breakpoints',
    'stacks',
    'watches',
    'repl',
    'console',
  },
  layouts = {
    {
      elements = {
        { id = 'scopes', size = 0.35 },
        { id = 'breakpoints', size = 0.15 },
        { id = 'stacks', size = 0.25 },
        { id = 'watches', size = 0.25 },
      },
      size = 0.3,
      position = 'left',
    },
    {
      elements = {
        { id = 'repl', size = 0.5 },
        { id = 'console', size = 0.5 },
      },
      size = 0.7,
      position = 'bottom',
    },
  },
}

dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

require('mason-nvim-dap').setup {
  ensure_installed = {
    'codelldb',
  },
  automatic_setup = true,
  handlers = {
    codelldb = function(config)
      require('dap').adapters.codelldb = {
        type = 'server',
        port = '${port}',
        executable = {
          command = 'codelldb',
          args = { '--port', '${port}' },
        },
      }
      config.configurations = {
        {
          type = 'codelldb',
          request = 'launch',
          name = 'Launch file',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = true,
        },
      }
    end,
  },
}

vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Continue' })
vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Step Over' })
vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Step Into' })
vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'Step Out' })
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint' })
vim.keymap.set('n', '<leader>B', function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end, { desc = 'Set Breakpoint with Condition' })
vim.keymap.set('n', '<leader>lp', dap.set_breakpoint, { desc = 'Set Logpoint',
  --[[ cond = 'vim.fn.input("Logpoint message: ")' -- TODO: This needs to be improved ]]
})
vim.keymap.set('n', '<leader>dr', dap.repl.toggle, { desc = 'Toggle REPL' })
vim.keymap.set('n', '<leader>dl', dap.run_last, { desc = 'Run Last' })
vim.keymap.set('n', '<leader>dt', dapui.toggle, { desc = 'Toggle UI' })

dap.configurations.c = {
  {
    name = 'Launch',
    type = 'codelldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/a.out', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  },
}
dap.configurations.cpp = dap.configurations.c
