return {
  "nanotee/zoxide.vim",
  {
    "jvgrootveld/telescope-zoxide",
    config = function()
      vim.keymap.set("n", "<leader>sz", require("telescope").extensions.zoxide.list, { desc = "[S]earch [Z]oxide" })
    end,
  }
}
