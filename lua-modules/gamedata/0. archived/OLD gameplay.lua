local M = {}

M.BUILDING = {}

-- Building types
---- 0 = main 
---- 1 = cash generator

M.BUILDING[1] = {
	type = 1, -- main
	level_init = 1,
	code_name = "main", 
	income_generation_speed = 2, -- in seconds
	income_rate = {0,0,0,0,0,0,0,0,0,0},-- income generated per second per Level for THIS level
	upgrade_cost = {100,250,400,650,1050,1700,2750,4450,7200,11650}, -- upgrade cost (to upgrade THIS level)
	upgrade_time = {5,10,15,25,40,65,105,180,285,465} -- upgrade time (to upgrade THIS level)
}

M.BUILDING[2] = { 
	type = 2, -- income generator
	level_init = 0,
	code_name = "income_generator", 
	income_generation_speed = 2, -- in seconds
	income_rate = {10,15,20,25,30,35,40,45,50,55},-- income generated per second per Level
	upgrade_cost = {100,250,400,650,1050,1700,2750,4450,7200,11650}, -- upgrade cost for THIS level (starts at 1)
	upgrade_time = {5,10,15,25,40,65,105,180,285,465} -- upgrade time for THIS level (starts at 1)
}

return M