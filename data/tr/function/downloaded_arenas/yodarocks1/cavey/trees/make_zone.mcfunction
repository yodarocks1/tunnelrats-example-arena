# @param x1   <int > | Team-side       X-coord
# @param x2   <int > | Opponent-side   X-coord
# @param cx   <int > | Center of slice X-coord
# @param y1   <int > | Lowest  Y-coord
# @param y2   <int > | Highest Y-coord
# @param cy   <int > | Center  Y-coord
# @param z1   <int > | Lowest  Z-coord
# @param z2   <int > | Highest Z-coord
# @param cz   <int > | Center  Z-coord
# @param dir  <int > | +1 or -1, indicating direction in X towards opposing team
# @param size <vec3> | {X,Y,Z} size


# Fill the floor
$execute positioned 0 $(y1) 0 \
         run fill $(x1) ~-1 $(z1) $(x2) ~-1 $(z2) grass_block

# Place lights
$execute positioned $(x1) $(y1) $(z1) run setblock ~ ~-1 ~ glowstone
$execute positioned $(x2) $(y1) $(z1) run setblock ~ ~-1 ~ glowstone
$execute positioned $(x1) $(y1) $(z2) run setblock ~ ~-1 ~ glowstone
$execute positioned $(x2) $(y1) $(z2) run setblock ~ ~-1 ~ glowstone
$execute positioned $(x1) $(y2) $(z1) run setblock ~ ~1 ~ glowstone
$execute positioned $(x2) $(y2) $(z1) run setblock ~ ~1 ~ glowstone
$execute positioned $(x1) $(y2) $(z2) run setblock ~ ~1 ~ glowstone
$execute positioned $(x2) $(y2) $(z2) run setblock ~ ~1 ~ glowstone

# Get rid of the command blocks before we build the trees
$fill $(x1) $(y1) $(z1) $(x2) $(y2) $(z2) air replace command_block

# Get rid of exposed raw iron blocks
$execute positioned $(x2) 0 0 \
         run fill ~$(dir) $(y1) $(z1) ~$(dir) $(y2) $(z2) stone replace raw_iron_block

# Summon a center tree so there's always at least one
$execute unless entity @n[type=marker,tag=tr.map.cavey.tree,tag=!tr.map.cavey.tree.center] \
         run summon minecraft:marker $(cx) 0 0.5 {Tags:['tr.map.cavey.tree','tr.map','tr.map.cavey.tree.center']}