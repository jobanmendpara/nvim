local status_ok, neoscroll = pcall(require, "neoscroll")
if not status_ok then
  return
end

neoscroll.setup({
  hide_cursor = true,
  stop_eof = true,
})
