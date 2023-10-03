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
     ft = "norg",
     dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-treesitter/nvim-treesitter-textobjects",
       "nvim-cmp",
       "nvim-lua/plenary.nvim",
     },
     build = ":Neorg sync-parsers",
     cmd = "Neorg",
    config = function()
      require("neorg").setup {
      load = {
       ["core.defaults"] = {},
       ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
       ["core.integrations.nvim-cmp"] = {},
       ["core.concealer"] = { config = { icon_preset = "diamond" } },
       ["core.export"] = {},
       ["core.dirman"] = {
            config = {
              workspaces = {
                life = "~/Desktop/ORG/life/",
                courses = "~/Desktop/ORG/life/courses"
              },
            },
        },
        -- Keybinds
       ["core.keybinds"] = {
         -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
         config = {
           default_keybinds = true,
           neorg_leader = "<Leader><Leader>",
         },
       },
     }
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
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function() require("nvim-surround").setup {} end,
  },
}
