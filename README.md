Some consumers for [neotest](https://github.com/nvim-neotest/neotest).

---

Mostly based on the following pattern I use when investigating a failing test:

1. Run the failing test once.
2. Close the test file, open the source code, change something.
3. Rerun the failing test again without opening the test file. ([`require("neotest").run.run_last()`](https://github.com/nvim-neotest/neotest/blob/8d279ac31542553461f5377db1596ae52e042d00/doc/neotest.txt#L461))
4. (optional) View the test's output using [`output_or_attach`](https://github.com/thenbe/neotest-consumers#%EF%B8%8F-output_or_attach) consumer.
5. (optional) Stop the current test run using [`stop_global`](https://github.com/thenbe/neotest-consumers#-stop_global) consumer.
6. Repeat steps 3-5 until done.

Apart from the initial test run (step 1), I don't need to open the test file again. I can just keep editing the source code and rerunning the test.

## Consumers

### 🕵️ output_or_attach

Resiliently view the test output.

This consumer will work regardless of which file you're currently editing. If there is a running test, it'll find it. If no test is currently running, it'll select the most recent test instead.

### 🛃 stop_global

Stop a test run from anywhere.

### 🧐 yank

Yanks the test command for the test under the cursor. You can then paste into a terminal, edit it, and run it manually. Useful for debugging.

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
