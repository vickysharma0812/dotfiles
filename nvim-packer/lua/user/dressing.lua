local status_ok, dressing = pcall(require, "dressing")
if not status_ok then
	print("dressing not found")
	return
end

dressing.setup()
