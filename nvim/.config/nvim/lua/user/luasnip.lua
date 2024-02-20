local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
  return
end

local status_ok, loader = pcall(require, "luasnip.loaders.from_lua")
if not status_ok then
  return
end

loader.load({paths = "~/.config/nvim/snippets/" })

ls.config.set_config({
    history = true,
    enable_autosnippets = true,
})
