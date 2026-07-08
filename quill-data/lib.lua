return function(plume)
	local request = require('luajit-request/init')
	local json    = require('json')

	local function get(url)
	    local res, err, msg = request.send(url)
	    if not res then
	     	return false, "Request failed: " .. (msg or "unknown error")
	    end
	    if res.code ~= 200 then
	    	return false, "HTTP " .. res.code .. ": " .. res.body
	    end

	    return true, res.body
	end

	local result = {}
	result.getTags = plume.obj.luaMacro("getTags", function(args)
		local url = args.table[1]

		local success, result = get(url .. "/tags")
		if not success then
			return false, result
		end

		local tags = json.decode(result)
		print(result)
		for _, t in ipairs(tags) do
			print(t.name)
		end
		return tags
	end)

	return plume.obj.quickTable(result)
end