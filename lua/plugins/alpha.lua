return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  enabled = true,
  init = false,
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    local logo = [[

  █████████          █████████
 ████████████      ████████████
  ███████████      ███████████
 ██████████████████████████████
 ██████████████████████████████
 ██████████████████████████████
 ██████████████████████████████
 ██████████████████████████████
    ████████████████████████
    ████████████████████████
        ████████████████
        ████████████████
            ████████
            ████████

]]
    dashboard.section.header.val = vim.split(logo, "\n")
    -- stylua: ignore
    local is_linux = jit.os == "Linux"
    local get_icon = require("astroui").get_icon
    dashboard.section.buttons.val = {
      dashboard.button("LDR n  ", get_icon("FileNew", 2, true) .. "New File  "),
      dashboard.button("LDR f f", get_icon("Search", 2, true) .. "Find File  "),
      dashboard.button("LDR f o", get_icon("DefaultFile", 2, true) .. "Recents  "),
      dashboard.button("LDR f w", get_icon("WordFile", 2, true) .. "Find Word  "),
      dashboard.button("LDR f '", get_icon("Bookmarks", 2, true) .. "Bookmarks  "),
      dashboard.button("LDR S l", get_icon("Refresh", 2, true) .. "Last Session  "),
      -- Lazy Buttons
      dashboard.button("c", " " .. " Config",
        "<cmd>Neotree " .. vim.fn.stdpath("config") .. "<CR>"),
      dashboard.button("l", "󰒲 " .. " Lazy", "<cmd> Lazy <cr>"),
      dashboard.button("q", " " .. " Quit", "<cmd> qa <cr>"),
    }
    if is_linux then
      table.insert(dashboard.section.buttons.val, 7,
        dashboard.button("e", "󰁨 " .. " Fix Shebang", "<cmd>lua require('termux').MasonFixShebang()<CR>"))
    end
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"
    --dashboard.opts.layout[1].val = 2
    dashboard.config.layout = {
      --{ type = "padding", val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) } },
      { type = "padding", val = 2 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 2 },
      dashboard.section.footer,
    }
    return dashboard
  end,
  config = function(_, dashboard)
    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "AlphaReady",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    require("alpha").setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      once = true,
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = "󰄛  Neovim loaded "
            .. stats.loaded
            .. "/"
            .. stats.count
            .. " plugins in "
            .. ms
            .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
