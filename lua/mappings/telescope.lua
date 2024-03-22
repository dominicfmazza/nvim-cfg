-- Telescope Settings
local wk = require("which-key")

wk.register({
        f = {
            name = "+telescope",
            f = { require("telescope.builtin").find_files, "Find Files" },
            g = { require("telescope.builtin").live_grep, "Live Grep" },
            b = { require("telescope.builtin").buffers, "Buffers" },
            h = { require("telescope.builtin").help_tags, "Help Tags" },
            ["/"] = { function()
                require("telescope.builtin").current_buffer_fuzzy_find()
            end, "Current Buffer" },
            c = { function()
                require("telescope.builtin").grep_string()
            end, "Find word under cursor" },
            k = { "<cmd>Legendary<cr>", "Find Keybinds" },
        }
    },
    {
        noremap = true,
        prefix = "<leader>"
    }
)
