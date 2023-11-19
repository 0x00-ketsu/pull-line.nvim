local config = require('pull-line.config')
local enums = require('pull-line.enums')
local popup = require('pull-line.popup')
local notify = require('pull-line.notify')

---@class Line
local Line = {}

---@return Line
function Line:init()
  local this = {}
  setmetatable(this, self)
  self.__index = self
  return this
end

---Copy the lines given by [range] to above/below the current cursor line
---
---@param direction DIRECTIONS?
function Line:copy(direction)
  self.action = enums.ACTIONS.COPY
  direction = direction or enums.DIRECTIONS.BELOW
  self.direction = direction

  local popup_item = self:_get_popup()
  popup.render(
      popup_item.relative, popup_item.position, popup_item.text, popup_item.prompt, function(value)
        if not self:_validate_popup_input(value) then
          notify.error('input value is invalid')
          return
        end

        local cmd_dict = {
          [enums.DIRECTIONS.ABOVE] = value .. 't.-1',
          [enums.DIRECTIONS.BELOW] = value .. 't.'
        }
        vim.api.nvim_command(cmd_dict[self.direction])
      end
  )
end

---Move the lines given by [range] to above/below the current cursor line
---
---@param direction DIRECTIONS?
function Line:move(direction)
  self.action = enums.ACTIONS.MOVE
  direction = direction or enums.DIRECTIONS.BELOW
  self.direction = direction

  local popup_item = self:_get_popup()
  popup.render(
      popup_item.relative, popup_item.position, popup_item.text, popup_item.prompt, function(value)
        if not self:_validate_popup_input(value) then
          notify.error('input value is invalid')
          return
        end

        local cmd_dict = {
          [enums.DIRECTIONS.ABOVE] = value .. 'm.-1',
          [enums.DIRECTIONS.BELOW] = value .. 'm.'
        }
        vim.api.nvim_command(cmd_dict[self.direction])
      end
  )
end

---@private
---
---Get popup related configuration items based on `action` & `direction`
---
---@return Line.popup
function Line:_get_popup()
  local conf_popup = config.opts.popup
  local text = conf_popup.text[self.action]
  local prompt_dict = {[enums.DIRECTIONS.ABOVE] = 'above', [enums.DIRECTIONS.BELOW] = 'below'}
  local prompt = conf_popup.prompt[prompt_dict[self.direction]]
  return {
    relative = conf_popup.relative,
    position = conf_popup.position,
    text = text,
    prompt = prompt
  }
end

---@private
---
---A validator for popup input value
---
---@param value string
---@return boolean
function Line:_validate_popup_input(value)
  if value == '' then
    return false
  end
  return true
end

return Line
