return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
    priority = 900,
  },
  {
    "nvim-neorg/neorg",
    ft = "norg", -- lazy load on filetype
    cmd = "Neorg", -- lazy load on command, allows you to autocomplete :Neorg regardless of whether it's loaded yet
    --  (you could also just remove both lazy loading things)
    priority = 30, -- treesitter is on default priority of 50, neorg should load after it.
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
          ["core.dirman"] = {
            config = {
              workspaces = {
                life = "~/Desktop/ORG/life/",
                journal = "~/Desktop/ORG/worg/",
              },
            },
          },
        },
      }
    end,
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000 },
  {
    "folke/twilight.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  { "ziontee113/color-picker.nvim" },
  { "sainnhe/sonokai" },
}
