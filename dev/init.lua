-- force reimport dev modules
package.loaded['dev'] = nil
package.loaded['dev.tests'] = nil

-- reimport plugin modules
package.loaded['pull-line'] = nil
package.loaded['pull-line.init'] = nil
package.loaded['pull-line.config'] = nil
package.loaded['pull-line.api'] = nil
package.loaded['pull-line.line'] = nil
package.loaded['pull-line.enums'] = nil
package.loaded['pull-line.popup'] = nil
package.loaded['pull-line.notify'] = nil

-- keymaps for develop nvim plugin
vim.api.nvim_set_keymap('n', 'dr', ':luafile dev/init.lua<CR>', { noremap = true })

testcase = require('dev.tests')
vim.api.nvim_set_keymap('n', 'de', ':lua testcase.execute()<CR>', { noremap = true })
