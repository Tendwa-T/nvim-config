return {
    "christoomey/vim-tmux-navigator",
    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
    },
    keys = {
        { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<CR>",  desc = "Window Left" },
        { "<C-j>", "<cmd><C-U>TmuxNavigateDown<CR>",  desc = "Window Down" },
        { "<C-k>", "<cmd><C-U>TmuxNavigateUp<CR>",    desc = "Window Up" },
        { "<C-l>", "<cmd><C-U>TmuxNavigateRight<CR>", desc = "Window Right" },
    },
}
