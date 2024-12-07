local languages = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact",
}

return {
  "mfussenegger/nvim-dap",
  lazy = true,
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    {
      "microsoft/vscode-js-debug",
      version = "1.x",
      build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
    },
    {
      "mxsdev/nvim-dap-vscode-js",
      config = function()
        print("nvim-dap-vscode-js")
        print(vim.fn.stdpath("data"))

        require("dap-vscode-js").setup({
          -- Path of node executable. Defaults to $NODE_PATH, and then "node"
          -- node_path = "node",

          -- Path to vscode-js-debug installation.
          debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),

          -- Command to use to launch the debug server. Takes precedence over "node_path" and "debugger_path"
          -- debugger_cmd = { "js-debug-adapter" },

          -- which adapters to register in nvim-dap
          adapters = {
            "chrome",
            "pwa-node",
            "pwa-chrome",
            "pwa-msedge",
            "pwa-extensionHost",
            "node-terminal",
          },

          -- Path for file logging
          -- log_file_path = "(stdpath cache)/dap_vscode_js.log",

          -- Logging level for output to file. Set to false to disable logging.
          -- log_file_level = false,

          -- Logging level for output to console. Set to false to disable console output.
          -- log_console_level = vim.log.levels.ERROR,
        })
      end,
    },
  },
  keys = {
    {
      "<leader>b",
      function()
        require("dap").toggle_breakpoint()
      end,
      "Toggle (b)reakpoing",
    },
    {
      "<leader>cd",
      function()
        require("dap").continue()
      end,
    },
    {
      "<leader>so",
      function()
        require("dap").step_over()
      end,
    },
    {
      "<leader>si",
      function()
        require("dap").step_into()
      end,
    },
    {
      "<leader>st",
      function()
        require("dap").step_out()
      end,
    },
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")

    for _, language in ipairs(languages) do
      dap.configurations[language] = {
        -- {
        --   type = "pwa-node",
        --   request = "launch",
        --   name = "Launch file",
        --   program = "${file}",
        --   cwd = "${workspacefolder}",
        --   sourcemaps = true,
        -- },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          program = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
          port = 9321,
          sourcemaps = true,
        },
      }
    end

    require("dapui").setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open({ reset = true })
    end
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close
  end,
}

--
-- return {
--   "mfussenegger/nvim-dap",
--   lazy = true,
--   dependencies = {
--     "rcarriga/nvim-dap-ui",
--     "nvim-neotest/nvim-nio",
--     -- lazy spec to build "microsoft/vscode-js-debug" from source
--     {
--       "microsoft/vscode-js-debug",
--       version = "1.x",
--       build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
--     },
--     {
--       "mxsdev/nvim-dap-vscode-js",
--       config = function()
--         ---@diagnostic disable-next-line: missing-fields
--         require("dap-vscode-js").setup({
--           -- Path of node executable. Defaults to $NODE_PATH, and then "node"
--           -- node_path = "node",
--
--           -- Path to vscode-js-debug installation.
--           debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
--
--           -- Command to use to launch the debug server. Takes precedence over "node_path" and "debugger_path"
--           -- debugger_cmd = { "js-debug-adapter" },
--
--           -- which adapters to register in nvim-dap
--           adapters = {
--             "chrome",
--             "pwa-node",
--             "pwa-chrome",
--             "pwa-msedge",
--             "pwa-extensionHost",
--             "node-terminal",
--           },
--
--           -- Path for file logging
--           -- log_file_path = "(stdpath cache)/dap_vscode_js.log",
--
--           -- Logging level for output to file. Set to false to disable logging.
--           -- log_file_level = false,
--
--           -- Logging level for output to console. Set to false to disable console output.
--           -- log_console_level = vim.log.levels.ERROR,
--         })
--       end,
--     },
--     {
--       "Joakker/lua-json5",
--       build = "./install.sh",
--     },
--   },
--   keys = {
--     {
--       "<leader>b",
--       function()
--         require("dap").toggle_breakpoint()
--       end,
--     },
--     {
--       "<leader>c",
--       function()
--         require("dap").continue()
--       end,
--     },
--     {
--       "<leader>da",
--       function()
--         if vim.fn.filereadable(".vscode/launch.json") then
--           local dap_vscode = require("dap.ext.vscode")
--           dap_vscode.load_launchjs(nil, {
--             ["pwa-node"] = languages,
--             ["chrome"] = languages,
--             ["pwa-chrome"] = languages,
--           })
--         end
--         require("dap").continue()
--       end,
--       desc = "Run with Args",
--     },
--   },
--   config = function()
--     local dap = require("dap")
--     -- require("dap").setup()
--     vim.api.nvim_set_hl(0, "DapStopedLine", { default = true, link = "Visual" })
--
--     for _, language in ipairs(languages) do
--       dap.configurations[language] = {
--         {
--           type = "pwa-node",
--           request = "launch",
--           name = "Launch file",
--           program = "${file}",
--           cwd = "${workspacefolder}",
--           sourcemaps = true,
--         },
--         {
--           type = "pwa-node",
--           request = "attach",
--           name = "Attach",
--           program = require("dap.utils").pick_process,
--           cwd = "${workspacefolder}",
--           sourcemaps = true,
--         },
--         {
--           type = "pwa-chrome",
--           request = "launch",
--           name = "Debug in chrome",
--           url = function()
--             local co = coroutine.running()
--             return coroutine.create(function()
--               vim.ui.input({
--                 prompt = "URL",
--                 default = "http://localhost:3000",
--               }, function(url)
--                 if url == nil then
--                   return
--                 end
--
--                 coroutine.resume(co, url)
--               end)
--             end)
--           end,
--           -- skipFiles = { "<node_internals>/**/*.js" },
--           protocol = "inspector",
--           webRoot = "${workspacefolder}",
--           sourcemaps = true,
--           userDataDir = false,
--         },
--       }
--     end
--
--     require("dapui").setup()
--   end,
-- }
