local twilight_status_ok, twilight = pcall(require, "twilight")
if not twilight_status_ok then
  return
end

twilight.setup {}
