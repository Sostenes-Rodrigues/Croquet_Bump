timer_invi = clamp(timer_invi - 1, 0, timer_invi_restart)

///
if timer_invi <= 0{
    if place_meeting(x, y, global.selected_entity){
        obj_boss_father.timer_invi = timer_invi_restart;
        
        
        if instance_exists(obj_boss_top){
            /// Codigo para
            explodir_parte(obj_boss_top)
            exit
        }
        else if instance_exists(obj_boss_middle){
            /// Codigo para
            explodir_parte(obj_boss_middle)
            exit
        }
        else if instance_exists(obj_boss_bottom){
            // Codigo para
            defeated_boss()
        }
    }
}