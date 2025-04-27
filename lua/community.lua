--if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  --{ import = "astrocommunity.pack.lua" },
  --{ import = "astrocommunity.pack.nvchad-ui" },
  --{ import = "astrocommunity.icon.mini-icons"},
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.indent.mini-indentscope" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.markdown-and-latex.markview-nvim" },
  { import = "astrocommunity.utility.noice-nvim" },
  --{ import = "astrocommunity.fuzzy-finder.snacks-picker" },
  -- import/override with your plugins folder
}
