-- From here => https://defold.com/assets/defold-polyglot/ (just made it slightly more generic and ready for insertion into tables)

local f = require "lua-modules.libs-self.functions"

local M = {}

local row_param_name = 1
local row_table_start = 2

local function import_csv(path)
	assert(path)
	local data = sys.load_resource(path)
	local output_table = {}
	local i = 1
	for line in string.gmatch(data, "[^\r\n]+") do
		output_table[i] = {}
		for word in string.gmatch(line, '([^,]+)') do
			if word == "TRUE" then word = true
			elseif word == "FALSE" then word = false
			end
			local num = tonumber(word)
			if num then word = num end
			table.insert(output_table[i], word)
		end
		i = i + 1
	end
	return output_table
end

M.polyglot = {}
M.language = ""

function M.import(path)
	local polyglot = import_csv(path)
	local string_id = nil
	local language_en = nil
	for row_i,row in ipairs(polyglot) do
		if row_i == row_param_name then
			language_en = row
		elseif row_i > (row_table_start-1) then
			for col_i,word in ipairs(row) do
				if col_i == 1 then
					string_id = word
				elseif (col_i > 2) then
					if not language_en[col_i] then break end
					if not M.polyglot[language_en[col_i]] then M.polyglot[language_en[col_i]] = {} end
					if not M.polyglot[language_en[col_i]][string_id] then M.polyglot[language_en[col_i]][string_id] = {} end
					M.polyglot[language_en[col_i]][string_id] = word
				end
			end
		end
	end
	return M.polyglot
end

function M.set_param_config(language_en)
	M.language = language_en
end

function M.get(string_id)
	return M.polyglot[M.language][string_id]
end

---=====================================---
-----=== ADDITIONAL FUNCTIONS (JC) ===-----
---=====================================---

-- To get the number of rows
function M.get_nb_rows(path)

	local config = import_csv(path)
	local count = 0
	for row_i,row in ipairs(config) do
		count = count + 1
	end
	return count - (row_table_start-1)

end

--To create a 2-dimension table of "split value" when we have 
function M.config_to_table(config_path,parameter_name,convert2number)

	M.import(config_path)
	local nb_rows = M.get_nb_rows(config_path)

	M.set_param_config(parameter_name)
	
	local table_init = {} -- 1 dimension table where we store the "unsplit" values (ex: 5|10|15|20 etc.)
	local table_final = {} -- 2 dimensional table where we replace the split values by a table with each value separated

	for i=1,nb_rows do
		table.insert(table_init, M.get(i))
		table_final[i] = mysplit(table_init[i],"|")
	end

	-- and now we turn the string into number (if necessary)
	local nb_columns = tablelength(table_final[1]) -- we consider always the same number of "levels" for each parameter

	if convert2number == true then
		for i=1,nb_rows do
			for j=1, nb_columns do
				table_final[i][j] = tonumber(table_final[i][j])
			end
		end
	end
	
	return table_final
	
end

return M