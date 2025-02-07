execute unless entity @n[type=minecraft:marker,tag=tr.map.cavey.cave,distance=0.1..1.5] run function tr:downloaded_arenas/yodarocks1/cavey/caves/remove
execute as @e[type=minecraft:marker,tag=tr.map.cavey.1] at @s run function tr:downloaded_arenas/yodarocks1/cavey/caves/make_one {x1:-1,y1:-1,z1:-1,x2:0,y2:0,z2:0}
execute as @e[type=minecraft:marker,tag=tr.map.cavey.2] at @s run function tr:downloaded_arenas/yodarocks1/cavey/caves/make_one {x1:1,y1:-1,z1:1,x2:0,y2:0,z2:0}
execute as @e[type=minecraft:marker,tag=tr.map.cavey.3] at @s run function tr:downloaded_arenas/yodarocks1/cavey/caves/make_one {x1:-1,y1:1,z1:1,x2:0,y2:0,z2:0}
execute as @e[type=minecraft:marker,tag=tr.map.cavey.4] at @s run function tr:downloaded_arenas/yodarocks1/cavey/caves/make_one {x1:1,y1:1,z1:-1,x2:0,y2:0,z2:0}
execute as @e[type=minecraft:marker,tag=tr.map.cavey.5] at @s run function tr:downloaded_arenas/yodarocks1/cavey/caves/make_one {x1:-1,y1:-1,z1:-1,x2:1,y2:1,z2:1}