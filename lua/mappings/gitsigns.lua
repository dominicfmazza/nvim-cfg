local wk = require("which-key")
-- git keybinds
wk.add(

  {
    { "<leader>g", group = "git" },
    {
      "<leader>gC",
      function()
        require("telescope.builtin").git_bcommits { use_file_path = true }
      end,
      desc = "Git commits (current file)"
    },
    {
      "<leader>gL",
      function() require("gitsigns").blame_line { full = true } end,
      desc = "Full Blame"
    },
    {
      "<leader>gS",
      function() require("gitsigns").stage_buffer() end,
      desc = "Stage Buffer"
    },
    {
      "<leader>gb",
      function()
        require("telescope.builtin").git_branches { use_file_path = true }
      end,
      desc = "Git branches"
    },
    {
      "<leader>gc",
      function()
        require("telescope.builtin").git_commits { use_file_path = true }
      end,
      desc = "Git commits (repository)"
    },
    {
      "<leader>gd",
      function() require("gitsigns").diffthis() end,
      desc = "View Diff"
    },
    {
      "<leader>gh",
      function() require("gitsigns").reset_hunk() end,
      desc = "Reset Hunk"
    },
    {
      "<leader>gl",
      function() require("gitsigns").blame_line() end,
      desc = "Blame"
    },
    {
      "<leader>gp",
      function() require("gitsigns").preview_hunk() end,
      desc = "Preview Hunk"
    },
    {
      "<leader>gr",
      function() require("gitsigns").reset_buffer() end,
      desc = "Reset Buffer"
    },
    {
      "<leader>gs",
      function() require("gitsigns").stage_hunk() end,
      desc = "Stage Hunk"
    },
    {
      "<leader>gt",
      function()
        require("telescope.builtin").git_status { use_file_path = true }
      end,
      desc = "Git status"
    },
    {
      "<leader>gu",
      function() require("gitsigns").undo_stage_hunk() end,
      desc = "Unstage Hunk"
    },
  }
)


wk.register({
  { "]g", function() require("gitsigns").next_hunk() end, desc = "Next Hunk" },
  { "[g", function() require("gitsigns").prev_hunk() end, desc = "Previous Hunk" },
})
