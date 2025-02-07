fill 17 -6 -5 11 -6 5 minecraft:grass_block
fill -11 -6 -5 -17 -6 5 minecraft:grass_block
fill 17 -6 -5 11 6 5 air replace minecraft:command_block
fill -11 -6 -5 -17 6 5 air replace minecraft:command_block

# Summon a tree if no other trees spawned
execute unless entity @e[type=minecraft:marker,tag=tr.map.cavey.tree] run function tr:downloaded_arenas/yodarocks1/cavey/trees/summon_missing

execute as @e[type=minecraft:marker,tag=tr.map.cavey.tree] at @s run fill ~ ~ ~ ~ ~ ~ air replace command_block
execute as @e[type=minecraft:marker,tag=tr.map.cavey.tree] at @s run function tr:downloaded_arenas/yodarocks1/cavey/trees/make_one