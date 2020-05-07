require("vis")

require("cursors")
local smart_backspace = require("smart-backspace")
smart_backspace.tab_width = 4
require("go/vis-go")

function win_open()
	vis:command("set autoindent on")
	vis:command("set theme transparent")
end

function file_open(file)
	current_file = file
	if file == nil or file.path == nil then return end
	file_type_exec(file.path)
end

vis.events.subscribe(vis.events.WIN_OPEN, win_open)
vis.events.subscribe(vis.events.FILE_OPEN, file_open)

function file_type_exec(path)
	if not path then return end

	if string.match(path, ".bs") then
		vis:command("set syntax html")
	elseif string.match(path, ".ts") or string.match(path, ".mjs") then
		vis:command("set syntax javascript")
	elseif string.match(path, ".go") then
		--vis:command("set go_fmt_binary goimports")
	elseif string.match(path, ".rs") then
		vis:command("set expandtab on")
		vis:command("set tabwidth 4")
	elseif string.match(path, ".py") then
		vis:command("set expandtab on")
		vis:command("set tabwidth 4")
	elseif string.match(path, "COMMIT_EDITMSG") then
		vis:command("set syntax diff")
	end
end
