local M = {}
-------------------------------------------------------

----------============---------
-----======= DEBUG ======------
----------============---------

M.G_DEBUG = 1 -- JC 24/01/2021 00:08 # 0/1 => debug text displayed or not


----------============---------
----====== GAMEPLAY =====-----
----------============---------

-- Economy
M.CASH_INIT = 20

-- UX
M.SCROLLING_MAX_NB_FRAMES = 3 -- JC 29/09/2021 21:02 # Used in the map scrolling (nb of frames recorded / inserted into a table)
M.SCROLLING_SENSIVITY = 0.75  -- from 0.5 to 1
M.SCROLLING_X = 0 -- 0: no / 1: yes
M.SCROLLING_Y = 1 -- 0: no / 1: yes

----------=====================---------
-----====== MESSAGE VARIABLES =====-----
----------=====================---------
M.GO_URL_MAIN_CONTROLLER = "/main_controller"

M.MSG_CASH_VARIATION_FROM_BUILDING = hash("$$$ variation from building")
M.MSG_CASH_VARIATION_FROM_MAIN = hash("$$$ total from main_controller")
M.MSG_MAIN_INITIALIZED = hash("main controller initialized!")
M.MSG_BUILDING_URL_TO_MAIN = hash("Building URLs")

------------===============-------------
------------===============-------------
------------===============-------------
------------===============-------------
--======== OLD (bb prototype) ========--
------------===============-------------
------------===============-------------
------------===============-------------
------------===============-------------


----------============---------
----====== FUNCTIONAL =====-----
----------============---------

M.G_DEBUG = 1 -- JC 24/01/2021 00:08 # 0/1 => debug text displayed or not

M.COLLECTION_CHAR_SELECTOR_NAME = "1.char_selector"
M.COLLECTION_GAMEPLAY_NAME = "2.gameplay"

M.CHARACTERS_QUANTITY = 3

----------============---------
----====== GAMEPLAY =====-----
----------============---------

-- JC 19/03/2021 16:39 # Game objects' names =>  (if renamed, this should be here)
M.GO_URL_COMMON_BATTLE = "/_common_battle"-- JC 09/04/2021 23:21 # This game object includes requires & debug scripts
M.GO_URL_PLAYER = "/player" -- JC 19/03/2021 16:59 # Player ID to be added (ex: "..self.ID" to target a player (ex: /player1, /player2 etc.)
M.GO_URL_BALL = "/ball"
M.GO_URL_GOAL_BLOCK = "/goal_block" -- JC 31/03/2021 23:46 # Player ID to be added (ex: "..self.ID" to target a goal block (ex: /goal_block_1, /goal_block_2 etc.)
M.GO_GOAL_BLOCK_QUANTITY = 10

M.GAMEPLAY_BALL_SPEED_SCALE_FACTOR = 1 -- JC 24/03/2021 21:32 # Not used yet
M.GAMEPLAY_BALL_SPEED_BASE = 500
M.GAMEPLAY_BALL_SPEED_MAX = M.GAMEPLAY_BALL_SPEED_BASE * 5
M.GAMEPLAY_BALL_SPEED_DECREASE = (M.GAMEPLAY_BALL_SPEED_MAX - M.GAMEPLAY_BALL_SPEED_BASE) / 100

M.GAMEPLAY_PLAYER_COLLISION_ZONE_Y_MIN = -70 -- JC 24/03/2021 21:32 # Used to define the block & punch collision angles
M.GAMEPLAY_PLAYER_COLLISION_ZONE_Y_MAX = 70 -- JC 24/03/2021 21:32 # Used to define the block & punch collision angles

M.GAMEPLAY_PLAYER_COLLISION_ANGLE_BLOCK_MAX = 15 -- JC 24/03/2021 21:32 # Only 1 side / Needs to multiply it by 2 for the whole angle

----------============---------
-----====== MESSAGES =====-----
----------============---------

M.MSG_PLAYER_TO_BALL_PROPERTIES = hash("collided_player_param_to_ball")
M.MSG_PLAYER_TO_BALL_PUNCH = hash("perfect punch")

return M