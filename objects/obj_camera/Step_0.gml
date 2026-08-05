/// Aumentando a room, caso precise
if (point_distance(x, 0, room_width, 0) < room_width_start){
    room_width += room_width_start * 2
}


/// Tracking the target, if there is one
if instance_exists(obj_selected_entity){
    x = lerp(x, obj_selected_entity.x, 0.2)
    y = lerp(y, obj_selected_entity.y, 0.2)
}