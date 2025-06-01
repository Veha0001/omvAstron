--@type LazySpec
return {
  {
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.completion.blink-cmp" },
    { import = "astrocommunity.colorscheme.catppuccin" },
    { import = "astrocommunity.indent.mini-indentscope" },
    { import = "astrocommunity.colorscheme.tokyonight-nvim" },
    { import = "astrocommunity.markdown-and-latex.markview-nvim" },
    { import = "astrocommunity.utility.noice-nvim" }
  },
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      -- change colorscheme
      colorscheme = "tokyonight-moon",
    },
  },
  {
    "AstroNvim/AstroNvim",
    { import = "mods" },
  }
}
