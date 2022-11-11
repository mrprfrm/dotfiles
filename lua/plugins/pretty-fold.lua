local fold_status_ok, fold = pcall(require, "pretty-fold")
if not fold_status_ok then
  return
end

fold.setup {}
