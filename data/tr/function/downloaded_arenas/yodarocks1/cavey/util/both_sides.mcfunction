# @param slice     <int > | Which slice should we be calling this on?
# @param callback  <func> | The function to call twice:
#    @with x1   <int > | Team-side       X-coord
#    @with x2   <int > | Opponent-side   X-coord
#    @with cx   <int > | Center of slice X-coord
#    @with y1   <int > | Lowest  Y-coord
#    @with y2   <int > | Highest Y-coord
#    @with cy   <int > | Center  Y-coord
#    @with z1   <int > | Lowest  Z-coord
#    @with z2   <int > | Highest Z-coord
#    @with cz   <int > | Center  Z-coord
#    @with dir  <int > | +1 or -1, indicating direction in X towards opposing team
#    @with size <vec3> | {X,Y,Z} size from team-side X, lowest Y, lowest Z

function tr:downloaded_arenas/yodarocks1/cavey/util/_load_arena_sections with storage tr:settings arena

# cy and cz should always be 0
data modify storage tr:tmp zone set value {cy:0,cz:0,size:{}}
$function tr:downloaded_arenas/yodarocks1/cavey/util/calculate_width {slice:$(slice),axis:"y"}
$function tr:downloaded_arenas/yodarocks1/cavey/util/calculate_width {slice:$(slice),axis:"z"}
$data modify storage tr:tmp zone.size.y set from storage tr:tmp arena_sections[$(slice)].y
$data modify storage tr:tmp zone.size.z set from storage tr:tmp arena_sections[$(slice)].z

$function tr:downloaded_arenas/yodarocks1/cavey/util/_both_sides_set_x {slice:$(slice),dir:1}
$function $(callback) with storage tr:tmp zone
$function tr:downloaded_arenas/yodarocks1/cavey/util/_both_sides_set_x {slice:$(slice),dir:-1}
$function $(callback) with storage tr:tmp zone

data remove storage tr:tmp arena_sections