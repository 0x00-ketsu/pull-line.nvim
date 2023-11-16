# pull-line.nvim

A Neovim plugin to copy/move the lines given by **range** to above/below the current cursor line.
A wraper of builtin command `:copy` `:move`.

**Range syntax** is same as **range** of builtin command `:copy` or `:move`.

![demo](https://github.com/0x00-ketsu/markdown-preview.nvim/assets/16932133/1be1faad-6742-424a-8e86-b655269508d0)

## Requirements

- Neovim version >= `0.5.0` (or [nightly](https://github.com/neovim/neovim/releases/tag/nightly))

## Installation

[Lazy](https://github.com/folke/lazy.nvim)

```lua
require('lazy').setup(
    {
      '0x00-ketsu/pull-line.nvim',
      dependencies = {'MunifTanjim/nui.nvim'},
      config = function()
        require('pull-line').setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the setup section below
        }

        local api = require('pull-line.api')
        if api ~= nil then
          vim.keymap.set('n', '<leader>cp', api.copy_below)
          vim.keymap.set('n', '<leader>cP', api.copy_above)
          vim.keymap.set('n', '<leader>mp', api.move_below)
          vim.keymap.set('n', '<leader>mP', api.move_above)
        end
      end
    }
)
```

## Setup

Following defaults:

```lua
require('pull-line').setup {
  popup = {
    relative = 'editor',
    position = '50%',
    text = {
      copy = ' Copy Lines ',
      move = ' Move Lines '
    },
    prompt = {
      above = '  ',
      below = '  '
    }
  }
}
```

### Configuration

- `popup.relative`

    See [nui.nvim relative](https://github.com/MunifTanjim/nui.nvim/blob/main/lua/nui/layout/README.md#relative)

- `popup.position`

    See [nui.nvim position](https://github.com/MunifTanjim/nui.nvim/blob/main/lua/nui/layout/README.md#position)

## API

- `require('pull-line.api').copy_above()`

    Copy the lines given by [range] to above the current cursor line

- `require('pull-line.api').copy_below()`

    Copy the lines given by [range] to below the current cursor line

- `require('pull-line.api').move_above()`

    Move the lines given by [range] to above the current cursor line

- `require('pull-line.api').move_below()`

    Move the lines given by [range] to below the current cursor line

## License

MIT
