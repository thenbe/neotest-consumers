Some consumers for [neotest](https://github.com/nvim-neotest/neotest).

### 🧐 yank

Yanks the command for the test under the cursor. Useful for debugging.

### 📇 output_or_attach

Resiliently view test output from any file. If a test is running, attach to it. Else, open the output of the most recent test.

### 🛃 stop_global

Stop a test run from anywhere.

Very useful when used alongside `require("neotest").run.run_last()`. This allows you to easily start, stop, and repeat a particular test(s) while working on relevant code. You don't even have to have the test file open.

## Installation

Using lazy:

```lua
{
  "nvim-neotest/neotest",

  dependencies = {
    -- 1. add as dependency to neotest
    "thenbe/neotest-consumers",
  },

  config = function()
    require("neotest").setup({
      consumers = {
        -- 2. add to your consumers list
        neotest_consumers = require("neotest-consumers").consumers,
      },
    })
  end,

  keys = {
    -- 3. map keys
    {
      "<leader>ts",
      function()
        require("neotest").neotest_consumers.stop_global()
      end,
      desc = "test stop",
    },
    {
      "<leader>to",
      function()
        require("neotest").neotest_consumers.output_or_attach()
      end,
      desc = "test output",
    },
    {
      "<leader>ty",
      function()
        require("neotest").neotest_consumers.yank()
      end,
      desc = "test yank command",
    },
  },
},
```
