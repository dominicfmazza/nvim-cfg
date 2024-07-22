-- Telescope Settings
local wk = require("which-key")

wk.add({
    { "<leader>f",  group = "+telescope", },
    { "<leader>ff", require("telescope.builtin").find_files, desc = "Find Files" },
    { "<leader>ft", "<cmd>TodoTelescope<cr>",                desc = "Find TODOs" },
    { "<leader>fg", require("telescope.builtin").live_grep,  desc = "Live Grep" },
    { "<leader>fb", require("telescope.builtin").buffers,    desc = "Buffers" },
    { "<leader>fh", require("telescope.builtin").help_tags,  desc = "Help Tags" },
    {
        "<leader>f/",
        function()
            require("telescope.builtin").current_buffer_fuzzy_find()
        end,
        desc = "Current Buffer"
    },
    {
        "<leader>fw",
        function()
            require("telescope.builtin").grep_string()
        end,
        desc = "Find word under cursor"
    },
    {
        noremap = true,
    }
})
