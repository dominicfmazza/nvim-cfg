local wk = require("which-key")
-- git keybinds

wk.register({
    g = {
      name = "+git",
      l = { function() require("gitsigns").blame_line() end, "Blame" },
      L = { function() require("gitsigns").blame_line { full = true } end, "Full Blame" },
      p = { function() require("gitsigns").preview_hunk() end, "Preview Hunk" },
      h = { function() require("gitsigns").reset_hunk() end, "Reset Hunk" },
      r = { function() require("gitsigns").reset_buffer() end, "Reset Buffer" },
      s = { function() require("gitsigns").stage_hunk() end, "Stage Hunk" },
      S = { function() require("gitsigns").stage_buffer() end, "Stage Buffer" },
      u = { function() require("gitsigns").undo_stage_hunk() end, "Unstage Hunk" },
      d = { function() require("gitsigns").diffthis() end, "View Diff" },
      b = { function()
        require("telescope.builtin").git_branches { use_file_path = true }
      end, "Git branches" },
      c = { function()
        require("telescope.builtin").git_commits { use_file_path = true }
      end,
        "Git commits (repository)",
      },
      C = { function()
        require("telescope.builtin").git_bcommits { use_file_path = true }
      end,
        "Git commits (current file)",
      },
      t = { function()
        require("telescope.builtin").git_status { use_file_path = true }
      end, "Git status" }
    }
  },
  { prefix = "<leader>" }

)

wk.register({
  ["]g"] = { function() require("gitsigns").next_hunk() end, "Next Hunk" },
  ["[g"] = { function() require("gitsigns").prev_hunk() end, "Previous Hunk" },
})
