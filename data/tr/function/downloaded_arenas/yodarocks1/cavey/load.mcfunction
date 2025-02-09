# |__Argument___|__Meaning_______________________________________|
# |  user_id    | Namespace, usually creator's username          |
# |  map_id     | Unique map id within namespace                 |
# |  version    | Unique string; only updates if versions differ |
# |  name       | Display name (string)                          |
# |  data       | Stores actual level information                |
#
# |__Data Arg___|__Meaning_______________________________________|
# |  sections   | The set of boxes that make up the arena        |
# |  section.x  | The distance/length of this box                |
# |  section.y  | The height of this box                         |
# |  section.z  | The width of this box                          |
# |  s.blocks[0]| The base block for this box                    |
# |  s.blocks.p | The probability as a percentage of any block being this block |
# |  base_inset | X offset of starting box: sum of X's + 7       | [Optional]
# |  info       | Text (JSON) that describes the arena           | [Optional]
# |  on         | Object containing callbacks; see table below   | [Optional]
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
	map_id:"cavey",																\
	version:"dev",																\
	name:"Cave-y Command Blocks",												\
	reload:"load",																\
	data:{																		\
		sections: [																\
			{																	\
				blocks:[														\
					{id:"minecraft:air",nbt:""},								\
					{p: 0.2f, id:"minecraft:command_block", nbt:{				\
						Command: "execute positioned ~ 0 ~ \
						                  unless entity @n[type=marker,distance=..4,tag=tr.map.cavey.pond] \
										  run summon marker ~ ~ ~ {Tags:['tr.map.cavey.pond','tr.map']}", \
						CustomName: '["Ponds"]',								\
						auto: 1b												\
					}},															\
					{p: 0.2f, id:"minecraft:command_block", nbt:{				\
						Command: "execute positioned ~ 0 ~ \
										  unless entity @n[type=marker,distance=..4,tag=tr.map.cavey.pond] \
						                  unless entity @n[type=marker,distance=..2,tag=tr.map.cavey.tree] \
										  run summon marker ~ ~ ~ {Tags:['tr.map.cavey.tree','tr.map']}", \
						CustomName: '["Trees"]',								\
						auto: 1b												\
					}}															\
				],																\
				x:7,y:11,z:11													\
			},																	\
			{																	\
				blocks:[														\
					{id:"minecraft:iron_ore", nbt:""},				\
					{p:82.8f, id:"minecraft:stone",nbt:""},								\
					{p: 3.0f, id:"minecraft:coal_ore", nbt:""},					\
					{p: 0.8f, id:"minecraft:command_block", nbt:{				\
						Command: "summon marker ~ ~ ~ {Tags:['tr.map.cavey.cave','tr.map'],data:{area:{ \
						x1: -1,y1: -1,z1: -1, \
						x2:  0,y2:  0,z2:  0  \
						}}}",													\
						CustomName: '["2x2x2 void, NW"]',						\
						auto: 1b												\
					}},															\
					{p: 0.8f, id:"minecraft:command_block", nbt:{				\
						Command: "summon marker ~ ~ ~ {Tags:['tr.map.cavey.cave','tr.map'],data:{area:{ \
						x1:  1,y1: -1,z1:  1, \
						x2:  0,y2:  0,z2:  0  \
						}}}",	\
						CustomName: '["2x2x2 void, SE"]',						\
						auto: 1b												\
					}},															\
					{p: 0.8f, id:"minecraft:command_block", nbt:{				\
						Command: "summon marker ~ ~ ~ {Tags:['tr.map.cavey.cave','tr.map'],data:{area:{ \
						x1: -1,y1:  1,z1:  1, \
						x2:  0,y2:  0,z2:  0  \
						}}}",	\
						CustomName: '["2x2x2 void, SW"]',						\
						auto: 1b												\
					}},															\
					{p: 0.8f, id:"minecraft:command_block", nbt:{				\
						Command: "summon marker ~ ~ ~ {Tags:['tr.map.cavey.cave','tr.map'],data:{area:{ \
						x1:  1,y1:  1,z1: -1, \
						x2:  0,y2:  0,z2:  0  \
						}}}",	\
						CustomName: '["2x2x2 void, NE"]',						\
						auto: 1b												\
					}},															\
					{p: 1.0f, id:"minecraft:command_block", nbt:{				\
						Command: "summon marker ~ ~ ~ {Tags:['tr.map.cavey.cave','tr.map'],data:{area:{ \
						x1: -1,y1: -1,z1: -1, \
						x2:  1,y2:  1,z2:  1  \
						}}}",	\
						CustomName: '["3x3x3 void"]',							\
						auto: 1b												\
					}}															\
				],																\
				x:11,y:11,z:11													\
			},																	\
			{																	\
				blocks:[														\
					{id:"minecraft:diamond_ore", nbt:""},				\
					{p:87.8f, id:"minecraft:stone",nbt:""},								\
					{p: 3.0f, id:"minecraft:coal_ore", nbt:""},					\
					{p: 0.8f, id:"minecraft:command_block", nbt:{				\
						Command: "summon marker ~ ~ ~ {Tags:['tr.map.cavey.cave','tr.map'],data:{area:{ \
						x1: -1,y1: -1,z1: -1, \
						x2:  0,y2:  0,z2:  0  \
						}}}",													\
						CustomName: '["2x2x2 void, NW"]',						\
						auto: 1b												\
					}},															\
					{p: 0.8f, id:"minecraft:command_block", nbt:{				\
						Command: "summon marker ~ ~ ~ {Tags:['tr.map.cavey.cave','tr.map'],data:{area:{ \
						x1:  1,y1: -1,z1:  1, \
						x2:  0,y2:  0,z2:  0  \
						}}}",	\
						CustomName: '["2x2x2 void, SE"]',						\
						auto: 1b												\
					}},															\
					{p: 0.8f, id:"minecraft:command_block", nbt:{				\
						Command: "summon marker ~ ~ ~ {Tags:['tr.map.cavey.cave','tr.map'],data:{area:{ \
						x1: -1,y1:  1,z1:  1, \
						x2:  0,y2:  0,z2:  0  \
						}}}",	\
						CustomName: '["2x2x2 void, SW"]',						\
						auto: 1b												\
					}},															\
					{p: 0.8f, id:"minecraft:command_block", nbt:{				\
						Command: "summon marker ~ ~ ~ {Tags:['tr.map.cavey.cave','tr.map'],data:{area:{ \
						x1:  1,y1:  1,z1: -1, \
						x2:  0,y2:  0,z2:  0  \
						}}}",	\
						CustomName: '["2x2x2 void, NE"]',						\
						auto: 1b												\
					}},															\
					{p: 1.0f, id:"minecraft:command_block", nbt:{				\
						Command: "summon marker ~ ~ ~ {Tags:['tr.map.cavey.cave','tr.map'],data:{area:{ \
						x1: -1,y1: -1,z1: -1, \
						x2:  1,y2:  1,z2:  1  \
						}}}",	\
						CustomName: '["3x3x3 void"]',							\
						auto: 1b												\
					}}															\
				],																\
				x:11,y:11,z:11													\
			},																	\
			{																	\
				blocks:[														\
					{id: "minecraft:obsidian", nbt:""}							\
				],																\
				x:1,y:3,z:3														\
			}																	\
		],																		\
		info:'["This is a test of the datapack download system! But more importantly, it runs tests with ",{"text":"Command Blocks","color":"dark_purple","bold":true}," and ",{"text":"Callbacks","color":"dark_purple","bold":true}]',	\
		on: {																	\
			ready: {															\
				arena: 'terrain_gen'											\
			}																	\
		},																		\
		base_inset: 0															\
	}																			\
}
