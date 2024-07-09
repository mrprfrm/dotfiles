local harpoon_ok, harpoon = pcall(require, "harpoon")
local path_ok, path = pcall(require, "plenary.path")
if not (harpoon_ok and path_ok) then
	return
end

harpoon:setup()

local function get_current_buf_name()
	local root = vim.loop.cwd()
	local current_buf = vim.api.nvim_get_current_buf()
	local buf_name = vim.api.nvim_buf_get_name(current_buf)
	return path:new(buf_name):make_relative(root)
end

function ADD_HARPOON()
	harpoon:list():add()
	print("Mark to " .. get_current_buf_name() .. " added")
end

function REMOVE_HARPOON()
	harpoon:list():remove()
	print("Mark to " .. get_current_buf_name() .. " removed")
end

function HARPOON_NEXT()
	harpoon:list():next()
end

function HARPOON_PREV()
	harpoon:list():prev()
end

function HARPOON_CLEAR()
	harpoon:list():clear()
	print("All marks removed")
end
