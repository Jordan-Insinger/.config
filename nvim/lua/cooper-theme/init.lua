-- comment here

local M = {};

local Colors = {
	bg = "#000000",
	fg = "#fffce8",
	white = "#ffffff",
	comment = "#00B017",
	yellow = "#ffff00",
	red = "#ff0000",
	blue = "#4790F5",
	neon_blue = "#00ECFF",
	pink = "#FF006F",
	orange = "#FF9100",
	neon_green = "#00FF90",
}

function M.colorscheme()
	vim.cmd('highlight clear')
	vim.cmd('syntax reset')

	vim.o.background = 'dark';
	vim.g.colors_name = 'cooper-theme';

	local set = vim.api.nvim_set_hl

	set(0, "Normal", {bg = Colors.bg, fg = Colors.fg})
	set(0, "Comment", {bg = Colors.bg, fg = Colors.comment})
	set(0, "Function", {bg = Colors.bg, fg = Colors.orange})
	set(0, "Type", {bg = Colors.bg, fg = Colors.neon_blue})
	set(0, "Identifier", {bg = Colors.bg, fg = Colors.blue})
	set(0, "Statement", {bg = Colors.bg, fg = Colors.pink})
	set(0, "String", {bg = Colors.bg, fg = Colors.neon_green})
	set(0, "LineNr", {bg = Colors.bg, fg = Colors.red})
	set(0, "LineNrAbove", {bg = Colors.bg, fg = Colors.yellow})
	set(0, "LineNrBelow", {bg = Colors.bg, fg = Colors.yellow})
	set(0, "CursorLineNr", {bg = Colors.red, fg = Colors.red})
	
end

return M
