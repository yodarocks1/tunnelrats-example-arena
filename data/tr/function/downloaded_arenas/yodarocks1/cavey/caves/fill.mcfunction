# Multiply X values by $(scale) and save in tr:tmp[area]
data modify storage tr:tmp area set from entity @s data.area
$execute store result storage tr:tmp area.x1 $(type) 1 \
         run data get entity @s data.area.x1 $(scale)
$execute store result storage tr:tmp area.x2 $(type) 1 \
         run data get entity @s data.area.x2 $(scale)

$say $(type) $(scale)

# Run with the multiplied values
function tr:downloaded_arenas/yodarocks1/cavey/caves/_dofill with storage tr:tmp area