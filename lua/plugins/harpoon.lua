local M = {
    "ThePrimeagen/harpoon",
    event = "VimEnter",
    config = function()
        require("harpoon").setup()

        require("telescope").load_extension("harpoon")
    end,
    keys = {
    },
}

return M
