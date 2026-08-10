with (global.selected_entity) {
	/// Rodar a funcao de carga da mira
    if draw_sight{
        if instance_exists(global.selected_entity) and instance_exists(obj_enemy_father){
            var _ang_target = point_direction(x, y, x + sprite_width * 4, room_height / 2)
            // Rodar a funcao de carga da mira
            ang_to_shoot = Loading_sight(ang_to_shoot, _ang_target, x, y)
            
            // Efeito de screenshake
            screenshake(choose(1, 2))
            
            //
            tween(id, "percent_overload_power", 1, tween_animation.circ_in, 5 * FPS_GAME)
            
            image_blend = merge_colour(c_white, make_colour_rgb(255 * percent_overload_power, 0, 80 * percent_overload_power), percent_overload_power)
        }
    }
}