local wk = require "which-key"

wk.register({
  m = {
    name = "+build",
    b = {
      function()
        require("nvchad.term").toggle {
          pos = "float",
          id = "floatTerm",
          cmd = "cmake --build build -j",
        }
      end,
      "CMake: Build",
    },
    d = {
      function()
        require("nvchad.term").toggle {
          pos = "float",
          id = "floatTerm",
          cmd = "cmake -B build -S . -DCMAKE_BUILD_TYPE=Debug",
        }
      end,
      "CMake: Configure Debug",
    },
    r = {
      function()
        require("nvchad.term").toggle {
          pos = "float",
          id = "floatTerm",
          cmd = "cmake -B build -S . -DCMAKE_BUILD_TYPE=Release",
        }
      end,
      "CMake: Configure Release",
    },
    p = {
      function()
        require("nvchad.term").toggle {
          pos = "float",
          id = "floatTerm",
          cmd = "cd docs && doxygen",
        }
      end,
      "Doxygen: Build Doxygen Docs",
    },
    c = {
      function()
        require("nvchad.term").toggle {
          pos = "float",
          id = "floatTerm",
          cmd = "rm -rf ./build/",
        }
      end,
      "CMake: Clean ./build/",
    },
  },
}, { noremap = true, silent = true, prefix = "<leader>" })
