return {
  "nvim-mini/mini.nvim",
  version = false,
  config = function()
    -- Отключаем стандартный dashboard LazyVim если используется
    -- vim.g.lazyvim_style = "starter"
    local starter = require("mini.starter")    -- Настройка mini.starter
    
    local header2 = [[
      ██╗   ██╗██████╗  █████╗
      ██║   ██║██╔══██╗██╔══██╗
      ██║   ██║██║  ██║███████║
      ██║   ██║██║  ██║██╔══██║
      ╚██████╔╝██████╔╝██║  ██║
       ╚═════╝ ╚═════╝ ╚═╝  ╚═╝
    ]]

    local items = {
      { name = "  New file",       action = "enew",                  key = "n", section = "Files" },
      -- { name = "  Find file",       action = "Telescope find_files", key = "f", section = "Telescope" },
      { name = "  Find file",       action = "Telescope find_files", key = "f", section = "Telescope" },
      { name = "  Find text",       action = "Telescope live_grep",  key = "g", section = "Telescope" },
      { name = "  Recent files",    action = "Telescope oldfiles",   key = "r", section = "Files" },
      { name = "  Open config",     action = "edit $MYVIMRC",        key = "c", section = "Config" },
      { name = "  Update plugins",  action = "Lazy sync",            key = "u", section = "Lazy" },
    }

          -- Footer (подсказка)
    local footer = "Press the key shown (n/f/g/...) or use arrows + Enter"   

      starter.setup({
        -- header = header_dynamic,  -- или header_ascii
        header = header2,
        items = items,
        footer = footer,
        evaluate_single = true, -- если хотите автоматически запускать, когда только 1 пункт
        loop = false,           -- прокрутка? (по необходимости)
      })

     vim.keymap.set("n", "<leader>ss", function() require("mini.starter").open() end, { desc = "Open starter" })

    -- require("mini.starter").setup({})

    -- Устанавливаем mini.starter как стартовый экран
     vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          if vim.fn.argc() == 0 then
            require("mini.starter").open()
          end
        end,
     })
  end,
}
