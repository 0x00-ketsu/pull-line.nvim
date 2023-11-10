local Line = require('pull-line.line')
local enums = require('pull-line.enums')

local M = {}

---Copy the lines given by [range] to above the current cursor line
---
M.copy_above = function()
  local line = Line:init()
  line:copy(enums.DIRECTIONS.ABOVE)
end

---Copy the lines given by [range] to below the current cursor line
---
M.copy_below = function()
  local line = Line:init()
  line:copy(enums.DIRECTIONS.BELOW)
end

---Move the lines given by [range] to above the current cursor line
---
M.move_above = function()
  local line = Line:init()
  line:move(enums.DIRECTIONS.ABOVE)
end

---Move the lines given by [range] to below the current cursor line
---
M.move_below = function()
  local line = Line:init()
  line:move(enums.DIRECTIONS.BELOW)
end

return M
