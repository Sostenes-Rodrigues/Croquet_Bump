draw_self()

// Rodar a funcao de carga da mira
if draw_sight{
    if instance_exists(global.selected_entity){
        ang_to_shoot = Loading_sight(ang_to_shoot, 0, global.selected_entity.x, global.selected_entity.y)
    }
}