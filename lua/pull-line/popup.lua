local Input = require('nui.input')
local event = require('nui.utils.autocmd').event

local M = {}

---Render an input box
---
---@param text string text of input box
---@param prompt string text of prompt
---@param cb_submit fun(value: string) callback on submit
M.render = function(text, prompt, cb_submit)
  -- LuaFormatter off
  local input = Input(
      {
        position = '50%',
        size = {width = 30},
        border = {
          style = 'rounded',
          text = {
            top = text,
            top_align = 'center'
          }
        },
        win_options = {
          winhighlight = 'Normal:Normal,FloatBorder:Normal'
        }
      },
      {
        prompt = prompt,
        on_submit = cb_submit,
      }
  )
  -- LuaFormatter on

  -- mount/open the component
  input:mount()
  -- unmount component when cursor leaves buffer
  input:on(
      event.BufLeave, function()
        input:unmount()
      end
  )
  -- unmount input by pressing `<Esc>` in normal mode
  input:map(
      'n', '<Esc>', function()
        input:unmount()
      end, {noremap = true}
  )
end

return M
