return {
  "HUAHUAI23/telescope-session.nvim",
  "rcarriga/nvim-notify",
  "onsails/lspkind.nvim",
  "hrsh7th/cmp-calc",
  "ziglang/zig.vim",
  { 'rose-pine/neovim', name = 'rose-pine' },

  {
    "lervag/vimtex",
    init = function()
      vim.cmd [[
        " viewer
        let g:vimtex_view_general_viewer = 'SumatraPDF'
        let g:vimtex_view_general_options
      \ = '-reuse-instance -forward-search @tex @line @pdf'
        " let g:vimtex_view_method = 'mupdf'
        " let g:vimtex_view_general_viewer = 'mupdf'

        " compiler
        let g:vimtex_compiler_latexmk_engines = {
        \ '_'                : '-lualatex',
        \ 'pdfdvi'           : '-pdfdvi',
        \ 'pdfps'            : '-pdfps',
        \ 'pdflatex'         : '-pdf',
        \ 'luatex'           : '-lualatex',
        \ 'lualatex'         : '-lualatex',
        \ 'xelatex'          : '-xelatex',
        \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
        \ 'context (luatex)' : '-pdf -pdflatex=context',
        \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
        \}

        let g:vimtex_compiler_latexrun_engines = {
        \ '_'                : 'lualatex',
        \ 'pdflatex'         : 'pdflatex',
        \ 'lualatex'         : 'lualatex',
        \ 'xelatex'          : 'xelatex',
        \}
      ]]
    end
  },

  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
      },
    },
  },

  {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('bamboo').setup {
        -- optional configuration here
      }
    end,
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      local logo = [[
        ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
        ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
        ██╔██╗ ██║██████╗ ██║   ██║██║   ██║██║██╔████╔██║
        ██║╚██╗██║██╔═══╝ ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
        ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
        ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
          -- stylua: ignore
          center = {
            { action = 'Telescope xray23 list', desc = " Session", icon = " ", key = "s" },
            { action = "Telescope oldfiles", desc = " Recent files", icon = " ", key = "r" },
            { action = "ene | startinsert", desc = " New file", icon = " ", key = "n" },
            { action = "Telescope find_files", desc = " Find file", icon = " ", key = "f" },
            { action = "Telescope live_grep", desc = " Find text", icon = " ", key = "g" },
            {
              action = [[lua require("lazyvim.util").telescope.config_files()()]],
              desc = " Config",
              icon = " ",
              key = "c"
            },
            { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
            { action = "qa", desc = " Quit", icon = " ", key = "q" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },

  {
    "shortcuts/no-neck-pain.nvim",
    opts = {
      width = 130,
    }
  },

  {
    'smoka7/hop.nvim',
    version = "*",
    config = function()
      require 'hop'.setup { keys = 'qsdfghjklmazertyuiopwxcvbn' }
      local hop = require('hop')
      local directions = require('hop.hint').HintDirection
      vim.keymap.set('', 'f',
        function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true }) end,
        { remap = true })
      vim.keymap.set('', 'F',
        function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true }) end,
        { remap = true })
      vim.keymap.set('', 't',
        function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }) end,
        { remap = true })
      vim.keymap.set('', 'T',
        function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }) end,
        { remap = true })
      vim.keymap.set('', '<leader>hc',
        function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false }) end,
        { remap = true, desc = '[H]op [C]haracter' })
      vim.keymap.set('', '<leader>hC',
        function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false }) end,
        { remap = true, desc = '[H]op [C]haracter' })
      vim.keymap.set('', '<leader>hw',
        function() hop.hint_words({ direction = directions.AFTER_CURSOR, current_line_only = false }) end,
        { remap = true, desc = '[H]op [W]ords' })
      vim.keymap.set('', '<leader>hW',
        function() hop.hint_words({ direction = directions.BEFORE_CURSOR, current_line_only = false }) end,
        { remap = true, desc = '[H]op [W]ords' })
      vim.keymap.set('', '<leader>hl', hop.hint_lines, { remap = true, desc = '[H]op [L]ines' })
      vim.keymap.set('', '<leader>hL', hop.hint_lines, { remap = true, desc = '[H]op [L]ines' })
      -- vim.keymap.set('', '<leader>ha', hop.hint_anywhere, { remap = true, desc = '[H]op [A]nywhere' })
    end,
  },

  {
    "LunarVim/bigfile.nvim",
    opts = {
    },
  },

  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
      -- <leader>rn rename
      vim.keymap.set("x", "<leader>re", ":Refactor extract ")
      vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")
      vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")
      vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")
      vim.keymap.set("n", "<leader>rI", ":Refactor inline_func")
      vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
      vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")
      vim.keymap.set({ "n", "x" }, "<leader>rr", function() require('refactoring').select_refactor() end)
    end,
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
    },
  },

  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
      open_mapping = [[<c-t>]],
      direction = 'horizontal',
      shell = "nu",
      -- winbar = { enabled = true },
    },
  },

  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
}
