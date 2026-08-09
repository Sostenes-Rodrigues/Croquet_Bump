with (global.selected_entity) {
	/// Rodar a funcao de carga da mira
    if draw_sight{
        if instance_exists(global.selected_entity) and instance_exists(obj_enemy_father){
            var _ang_target = point_direction(x, y, x + sprite_width * 4, room_height / 2)
            // Rodar a funcao de carga da mira
            ang_to_shoot = Loading_sight(ang_to_shoot, _ang_target, x, y)
            
            // Efeito de screenshake
            screenshake(choose(1, 2))
        }
    }
}