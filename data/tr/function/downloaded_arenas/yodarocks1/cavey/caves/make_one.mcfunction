execute if entity @s[tag=tr.map.flip,tag=!tr.map.center] \
        run function tr:downloaded_arenas/yodarocks1/cavey/caves/fill {type:"int",scale:-1}

execute if entity @s[tag=tr.map.noflip,tag=!tr.map.center] \
        run function tr:downloaded_arenas/yodarocks1/cavey/caves/fill {type:"int",scale:1}

execute if entity @s[tag=tr.map.center] \
        run function tr:downloaded_arenas/yodarocks1/cavey/caves/fill {type:"int",scale:-1}
execute if entity @s[tag=tr.map.center] \
        run function tr:downloaded_arenas/yodarocks1/cavey/caves/fill {type:"int",scale:1}

#setblock ~ ~ ~ air
#kill @s