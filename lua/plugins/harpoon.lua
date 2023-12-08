local harpoon_ok, harpoon = pcall(require, "harpoon")
if not harpoon_ok then
	return
end

harpoon:setup()

function TOGGLE_HARPOON_MENU()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end

function ADD_HARPOON()
	harpoon:list():append()
end

function REMOVE_HARPOON()
	harpoon:list():remove()
end

function HARPOON_NEXT()
	harpoon:list():next()
end

function HARPOON_PREV()
	harpoon:list():prev()
end
