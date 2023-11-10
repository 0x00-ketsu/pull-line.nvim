local config = require('pull-line.config')
local notify = require('pull-line.notify')

local M = {}

---@param opts Config?
M.setup = function(opts)
  config.setup(opts)

  -- Validate Neovim version
  if vim.fn.has('nvim-0.5') == 0 then
    local errmsg = ' requires Neovim version should greater than 0.5 or nightly'
    notify.error(config.plugin_name .. errmsg)
    return
  end
end

return M
