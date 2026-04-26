-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec
return {
  {
    'xiyaowong/transparent.nvim',
    priority = 1000,
    config = function()
      require('transparent').setup {
        -- table: default groups
        groups = {
          'Normal',
          'NormalNC',
          'Comment',
          'Constant',
          'Special',
          'Identifier',
          'Statement',
          'PreProc',
          'Type',
          'Underlined',
          'Todo',
          'String',
          'Function',
          'Conditional',
          'Repeat',
          'Operator',
          'Structure',
          'LineNr',
          'NonText',
          'SignColumn',
          'CursorLine',
          'CursorLineNr',
          'StatusLine',
          'StatusLineNC',
          'EndOfBuffer',
        },
        -- table: additional groups that should be cleared
        extra_groups = {},
        -- table: groups you don't want to clear
        exclude_groups = {},
        -- function: code to be executed after highlight groups are cleared
        -- Also the user event "TransparentClear" will be triggered
        on_clear = function() end,
      }
    end,
  },
  {
    'GustavEikaas/easy-dotnet.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'folke/snacks.nvim' },
    config = function() require('easy-dotnet').setup() end,
  },
  {
    'folke/snacks.nvim',
    ---@type snacks.Config
    opts = {
      picker = {
        sources = {
          explorer = {
            win = {
              list = {
                keys = {
                  ['A'] = 'explorer_add_dotnet',
                },
              },
            },
            actions = {
              explorer_add_dotnet = function(picker)
                local dir = picker:dir()
                local easydotnet = require 'easy-dotnet'

                easydotnet.create_new_item(dir, function(item_path)
                  local tree = require 'snacks.explorer.tree'
                  local actions = require 'snacks.explorer.actions'
                  tree:open(dir)
                  tree:refresh(dir)
                  actions.update(picker, { target = item_path })
                  picker:focus()
                end)
              end,
            },
          },
        },
      },
    },
  },
}
