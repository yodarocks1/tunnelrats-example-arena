# @param dir  <int > | +1 or -1, indicating direction in X towards opposing team

$data modify storage tr:tmp zone.dir set value $(dir)
$execute store result storage tr:tmp zone.size.x int $(dir) run data get storage tr:tmp arena_sections[$(slice)].x
execute store result score #cx tmp run data get storage tr:tmp zone.size.x 0.5
execute store result score #x2 tmp run data get storage tr:tmp zone.size.x 1
execute store result score #x tmp run data get storage tr:gen template.totalX -1
$scoreboard players operation #x tmp *= $(dir) const
scoreboard players set #dx tmp 7
$scoreboard players operation #dx tmp *= $(dir) const

scoreboard players operation #x tmp += #dx tmp
scoreboard players operation #x1 tmp = #x tmp
$scoreboard players set #cxadder tmp $(dir)
scoreboard players operation #cxadder tmp > 0 const
scoreboard players operation #cx tmp += #cxadder tmp
$execute store result storage tr:tmp zone.x1 int 1 run scoreboard players operation #x1 tmp += $(dir) const
execute store result storage tr:tmp zone.x2 int 1 run scoreboard players operation #x2 tmp += #x tmp
execute store result storage tr:tmp zone.cx int 1 run scoreboard players operation #cx tmp += #x tmp
