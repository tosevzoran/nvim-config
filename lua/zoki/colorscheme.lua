local isOk, nightfox = pcall(require, "nightfox")
if not isOk then
  vim.notify("nightfox not loaded")
  return
end

nightfox.setup({
  options = {
    dim_inactive = true,
    styles = {
      comments = "italic",
      keywords = "bold",
      functions = "italic,bold",
    }
  }
})
-- vim.cmd [[
-- try
--  colorscheme nightfox
-- catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme default
--   set background=dark
-- endtry
-- ]] 

vim.cmd("colorscheme nightfox")
