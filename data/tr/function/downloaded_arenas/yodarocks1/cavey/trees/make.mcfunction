function tr:downloaded_arenas/yodarocks1/cavey/util/both_sides {slice:0,callback:"tr:downloaded_arenas/yodarocks1/cavey/trees/make_zone"}

execute as @e[type=marker,tag=tr.map.cavey.tree.center] at @s run kill @e[type=marker,tag=tr.map.cavey.pond,distance=..4]
execute as @e[type=marker,tag=tr.map.cavey.tree] at @s if block ~ ~ ~ command_block run setblock ~ ~ ~ air
execute as @e[type=marker,tag=tr.map.cavey.tree] at @s run function tr:downloaded_arenas/yodarocks1/cavey/trees/make_one