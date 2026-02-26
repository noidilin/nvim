local reserved =
	{ 'default', 'error', 'layout', 'loading', 'not-found', 'page', 'route', 'template' }
local utils = { 'actions', 'components', 'data', 'entities', 'hooks', 'lib', 'utils', 'env' }
local utils_temp = {
	['actions'] = 'act',
	['components'] = 'cmp',
	['data'] = 'data',
	['entities'] = 'ent',
	['hooks'] = 'hooks',
	['lib'] = 'lib',
	['utils'] = 'util',
	['env'] = 'env',
}

local function isNext()
	local sep = package.config:sub(1, 1) -- OS-specific path separator
	local root = LazyVim.root()

	-- similar to reduce array method in javascript
	if
		vim.iter({ 'next.config.js', 'next.config.ts', 'next.config.mjs' }):any(function(f)
			return vim.fn.filereadable(root .. sep .. f) == 1
		end)
	then
		return true
	end
end

local function getBufName(path, name)
	-- Split path into segments (works on both "/" and "\" separators)
	local segments = {}
	for seg in path:gmatch('[^/\\]+') do
		table.insert(segments, seg)
	end
	local seg_count = #segments

	-- Rule 1: Next.js special file under an 'app' directory
	if vim.tbl_contains(reserved, name) then
		-- Look for "app" in any ancestor directory
		for i, seg in ipairs(segments) do
			if seg == 'app' and i < seg_count then
				-- Use the immediate parent folder of the file
				local parent = segments[seg_count - 1] or ''
				return parent .. '/' .. name
			end
		end
	end

	-- Rule 2: File in a utility folder at project root (or anywhere in path)
	for _, seg in ipairs(segments) do
		-- if vim.tbl_contains(utils, seg) then
		-- 	return seg .. "/" .. name
		-- end
		if utils_temp[seg] then
			return utils_temp[seg] .. '/' .. name
		end
	end

	-- Otherwise, fallback to default (nil or file_name)
	return nil
end

return {
	'akinsho/bufferline.nvim',
	opts = {
		options = {
			always_show_bufferline = true,
			sort_by = 'insert_at_end',
			name_formatter = function(buf)
        -- stylua: ignore
				if not isNext() then return nil end

				local path = buf.path -- Full file path
				local name = vim.fn.fnamemodify(path, ':t:r') -- Strip extension ("page.tsx" -> "page")
				return getBufName(path, name)
			end,
		},
	},
}
