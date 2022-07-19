local status_ok, dark_notify = pcall(require, "dark_notify")
if not status_ok then
  return
end

dark_notify.run()

