# |__Argument__|__Meaning_______________________________________|
# |   user_id  | Namespace, usually creator's username          |
# |   map_id   | Unique map id within namespace                 |
# |   version  | Unique string; only updates if versions differ |
# |   name     | Display name (string)                          |
# |   data     | Stores actual level information                |
#
# |__Data Arg__|__Meaning_______________________________________|
# |   base     |                                                |
# |   sections |                                                |
# |   totalX   | Sum of all X values in sections, plus 7        | **VERIFY**
# |   info     | Text (JSON) that describes the arena           | [Optional]
# |   on       | Object containing callbacks; see table below   | [Optional]
#
# The callback "ASDF/asdf" will call the function tr:downloaded_arenas/$(user_id)/$(map_id)/ASDF/asdf
# |_Order_|__Callbacks_________|__Timing____________________________________________________________|__Call Location_______________________________________|
# |   0   | load               | Called before generation logic begins                              | end of game/start                                    |
# |   1   | tick.generating    | Called each tick during generation                                 | end of generation/generation/next                    |
# |   2   | ready.arena        | Called right after generation finishes                             | start of generation/end                              |
# |   3   | ready.players      | Called right after player setup finishes                           | end of game/player/setup_players                     |
# |   4   | tick.wait_to_start | Called each tick post-generation during the planning/waiting phase | end of game/wait_to_start (if #gameStart timer > 0)  |
# |   5   | start              | Called when play begins                                            | end of game/wait_to_start (if #gameStart timer <= 0) |
# |   6   | tick.running       | Called each tick while the game is in-play                         | end of game/running                                  |
# |   7   | end                | Called when play ends                                              | end of game/end                                      |
# |   8   | tick.ending        | Called each tick while the game is ending                          | end of game/ending                                   |
# |   9   | unload             | Called as the map is being reset/unloaded                          | start of game/reset                                  |
#

return run function tr:data_update/from_datapack {								\
	user_id:"yodarocks1",														\
	map_id:"test_scoreboard",														\
	version:"dev",																\
	name:"Callback Test (Scoreboard)",											\
	data:{																		\
		totalX: 18,																\
		base: {x:11,y:11,z:11},													\
		sections: [																\
			{																	\
				blocks:[														\
					{id:"minecraft:oak_planks",nbt:""}							\
				],																\
				x:11,y:11,z:11													\
			}																	\
		],																		\
		info:'[{"text":"This is a test of the datapack callback system!"}]',	\
		on: {																	\
			load: 'scoreboard/load',											\
			start: 'scoreboard/start',											\
			end: 'scoreboard/end',												\
			unload: 'scoreboard/unload',										\
			tick: {																\
				generating: 'scoreboard/tick/generating',						\
				wait_to_start: 'scoreboard/tick/wait_to_start',					\
				running: 'scoreboard/tick/running',								\
				ending: 'scoreboard/tick/ending'								\
			},																	\
			ready: {															\
				arena: 'scoreboard/ready/arena',								\
				players: 'scoreboard/ready/players'								\
			}																	\
		}																		\
	}																			\
}