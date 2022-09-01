local lib_status_ok, lib = pcall(require, 'litee.lib')
local gh_status_ok, gh = pcall(require, 'litee.gh')
if not lib_status_ok then
  return
end
if not gh_status_ok then
  return
end

lib.setup()
gh.setup()

