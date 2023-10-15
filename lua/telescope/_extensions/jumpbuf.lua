local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local conf = require("telescope.config").values

local function show_jumpbuf(opts)
	opts = opts or { show_line = false }
	local jumplist = vim.fn.getjumplist()[1]
	local filter_bufnr = {}
	-- reverse the list
	local sorted_jumplist = {}
	for i = #jumplist, 1, -1 do
		if vim.api.nvim_buf_is_valid(jumplist[i].bufnr) and not filter_bufnr[jumplist[i].bufnr] then
			filter_bufnr[jumplist[i].bufnr] = true
			jumplist[i].text = vim.api.nvim_buf_get_lines(
				jumplist[i].bufnr,
				jumplist[i].lnum - 1,
				jumplist[i].lnum,
				false
			)[1] or ""
			table.insert(sorted_jumplist, jumplist[i])
		end
	end

	pickers
		.new(opts, {
			prompt_title = "Jumplist",
			finder = finders.new_table({
				results = sorted_jumplist,
				entry_maker = make_entry.gen_from_quickfix(opts),
			}),
			previewer = conf.qflist_previewer(opts),
			sorter = conf.generic_sorter(opts),
		})
		:find()
end

local function run()
	show_jumpbuf()
end

return require("telescope").register_extension({
	exports = {
		-- Default when to argument is given, i.e. :Telescope jumpbuf
		jumpbuf = run,
	},
})
