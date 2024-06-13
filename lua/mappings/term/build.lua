local wk = require "which-key"

wk.register({
  m = {
    name = "+build",
    b = {
      function()
        require("nvchad.term").toggle {
          pos = "float",
          id = "cmaketerm",
          cmd = "cmake --build build -j; exit",
          clear_cmd = false,
        }
      end,
      "CMake: Build",
    },
    d = {
      function()
        require("nvchad.term").toggle {
          pos = "float",
          id = "cmaketerm",
          cmd = "cmake -B build -S . -DCMAKE_BUILD_TYPE=Debug; exit",
        }
      end,
      "CMake: Configure Debug",
    },
    r = {
      function()
        require("nvchad.term").toggle {
          pos = "float",
          id = "cmaketerm",
          cmd = "cmake -B build -S . -DCMAKE_BUILD_TYPE=Release; exit",
        }
      end,
      "CMake: Configure Release",
    },
    p = {
      function()
        require("nvchad.term").toggle {
          pos = "float",
          id = "cmaketerm",
          cmd = "cd docs && doxygen; exit",
        }
      end,
      "Doxygen: Build Doxygen Docs",
    },
    c = {
      function()
        require("nvchad.term").toggle {
          pos = "float",
          id = "cmaketerm",
          cmd = "rm -rf ./build/; exit",
        }
      end,
      "CMake: Clean ./build/",
    },
  },
}, { noremap = true, silent = true, prefix = "<leader>" })
