---@type Config
local defaults = {
  popup = {
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

---@class Config
local M = {plugin_name = 'pull-line.nvim'}

---@type Config?
M.opts = nil

---Assign options
---
---@param opts Config?
M.setup = function(opts)
  M.opts = vim.tbl_deep_extend('force', {}, defaults, opts or {})
end

M.setup {}

return M
