local enums = require('pull-line.enums')
local Line = require('pull-line.line')

local M = {}

M.execute = function()
  require('pull-line').setup {}

  local line = Line:init()
  line:copy(enums.DIRECTIONS.ABOVE)
end

return M
