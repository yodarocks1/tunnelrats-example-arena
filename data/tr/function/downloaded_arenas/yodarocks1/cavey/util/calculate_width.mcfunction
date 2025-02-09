# @requires tr:tmp arena_sections | contains all sections of the currently selected arena 
# @param slice <int> |
# @param axis  <str> |

$execute store result storage tr:tmp zone.$(axis)1 int -0.5 run data get storage tr:tmp arena_sections[$(slice)].$(axis)
$execute store result storage tr:tmp zone.$(axis)2 int 0.5 run data get storage tr:tmp arena_sections[$(slice)].$(axis)
$execute store result score #widthIsOdd tmp run data get storage tr:tmp arena_sections[$(slice)].$(axis) 1
scoreboard players operation #widthIsOdd tmp %= 2 const
$execute store result score #$(axis)2 tmp run data get storage tr:tmp zone.$(axis)2
$execute store result storage tr:tmp zone.$(axis)2 int 1 run scoreboard players operation #$(axis)2 tmp -= #heightIsOdd tmp