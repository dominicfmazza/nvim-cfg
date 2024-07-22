local wk = require "which-key"
wk.add({
  { "<leader>m",    group = "+build" },
  {
    "<leader>mb",
    function()
      require("nvchad.term").toggle {
        pos = "float",
        id = "cmaketerm",
        cmd = "cmake --build build -j; exit",
        clear_cmd = false,
      }
    end,
    desc = "CMake: Build",
  },
  {
    "<leader>md",
    function()
      require("nvchad.term").toggle {
        pos = "float",
        id = "cmaketerm",
        cmd = "cmake -B build -S . -DCMAKE_BUILD_TYPE=Debug; exit",
      }
    end,
    desc = "CMake: Configure Debug",
  },
  {
    "<leader>mr",
    function()
      require("nvchad.term").toggle {
        pos = "float",
        id = "cmaketerm",
        cmd = "cmake -B build -S . -DCMAKE_BUILD_TYPE=Release; exit",
      }
    end,
    desc = "CMake: Configure Release",
  },
  {
    "<leader>mc",
    function()
      require("nvchad.term").toggle {
        pos = "float",
        id = "cmaketerm",
        cmd = "rm -rf ./build/; exit",
      }
    end,
    desc = "CMake: Clean ./build/",
  },
  { noremap = true, silent = true, }
})
