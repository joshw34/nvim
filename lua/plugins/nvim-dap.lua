return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local mason_dap = require("mason-nvim-dap")
    local dap = require("dap")
    local ui = require("dapui")
    local dap_virtual_text = require("nvim-dap-virtual-text")
    -- VIRTUAL TEXT
    dap_virtual_text.setup()
    -- MASON DAP
    mason_dap.setup({
      ensure_installed = {},
      automatic_installation = true,
      handlers = {
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end,
      },
    })
    -- DAP ADAPTERS
    dap.adapters.gdb = {
      type = "executable",
      command = "/usr/sbin/gdb",
      args = { "-i", "dap" }
    }
    dap.adapters.lldb = {
      type = "executable",
      command = "/usr/bin/lldb-dap",
      name = "lldb"
    }
    -- DAP CONFIGURATIONS
    dap.configurations.cpp = {
      -- GDB
      {
        name = "[GDB] Launch (no args)",
        type = "gdb",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtBeginningOfMainSubprogram = false,
      },
      {
        name = "[GDB] Launch (with args)",
        type = "gdb",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        args = function()
          local args_string = vim.fn.input('Arguments: ')
          if args_string == "" then
            return {}
          end
          return vim.split(args_string, " +")
        end,
        cwd = '${workspaceFolder}',
        stopAtBeginningOfMainSubprogram = false,
      },
      {
        name = '[GDB] Attach to process',
        type = 'gdb',
        request = 'attach',
        pid = function()
          return tonumber(vim.fn.input('Process ID: '))
        end,
        cwd = '${workspaceFolder}',
      },
      -- LLDB
      {
        name = "[LLDB] Launch (no args)",
        type = "lldb",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
      {
        name = "[LLDB] Launch (with args)",
        type = "lldb",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        args = function()
          local args_string = vim.fn.input('Arguments: ')
          if args_string == "" then
            return {}
          end
          return vim.split(args_string, " +")
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
      {
        name = '[LLDB] Attach to process',
        type = 'lldb',
        request = 'attach',
        pid = function()
          return tonumber(vim.fn.input('Process ID: '))
        end,
        cwd = '${workspaceFolder}',
      },
    }
    dap.configurations.c = dap.configurations.cpp
    -- DAP UI
    ui.setup()
    vim.fn.sign_define("DapBreakpoint", { text = "🐞" })
    dap.listeners.before.attach.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      ui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      ui.close()
    end
    -- KEYMAPS
    vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
    vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
    vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step Over" })
    vim.keymap.set("n", "<leader>du", dap.step_out, { desc = "Step Out" })
    vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })
    vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Run Last" })
    vim.keymap.set("n", "<leader>dq", function()
      dap.terminate()
      ui.close()
      dap_virtual_text.toggle()
    end, { desc = "Terminate" })
    vim.keymap.set("n", "<leader>db", dap.list_breakpoints, { desc = "List Breakpoints" })
    vim.keymap.set("n", "<leader>de", function()
      dap.set_exception_breakpoints({ "all" })
    end, { desc = "Set Exception Breakpoints" })
  end
}
