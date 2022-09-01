# ENHANCEMENT: add boiler plate lua snippets

## Boilerplate for all my plugins' setup
local status_ok, plugin = pcall(require, ‘plugin’)
if not status_ok then
  return
end
