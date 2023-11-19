local Line = require('pull-line.line')
local enums = require('pull-line.enums')

local M = {}

M.execute = function()
  require('pull-line').setup({})

  local line = Line:init()
  line:copy(enums.DIRECTIONS.ABOVE)
end

return M
