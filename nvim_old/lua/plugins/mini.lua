return {
  {
    'echasnovski/mini.nvim',
    version = false,
    init = function()
      require('mini.pairs').setup()
      require('mini.surround').setup()
      require('mini.cursorword').setup({ delay = 0, })
      require('mini.splitjoin').setup()
    end,
  },
}
