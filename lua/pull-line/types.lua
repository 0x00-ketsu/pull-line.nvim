---@meta

---
---NOTE: Types for Configuration
---

---@class Config
---@field popup Config.popup

---@class Config.api
---@field copy fun(direction: DIRECTIONS?)
---@field move fun(direction: DIRECTIONS?)

---@class Config.popup
---@field text Config.popup.text
---@field prompt Config.popup.prompt

---@class Config.popup.text
---@field copy string
---@field move string

---@class Config.popup.prompt
---@field above string
---@field below string

---
---NOTE: Types for Line
---

---@class Line
---@field action string such as `copy` or `move`
---@field direction number 0: above, 1: below
---@field popup Line.popup

---@class Line.popup
---@field text string
---@field prompt string
