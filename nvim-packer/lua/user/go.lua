local status_ok, go = pcall(require, "go")
if not status_ok then
  print("go not found")
  return
end

go.setup()
