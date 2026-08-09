///
if instance_place(x, y, global.selected_entity){
    if instance_exists(obj_boss_top){
        /// Codigo para
        explodir_parte(obj_boss_top)
    }
    else if instance_exists(obj_boss_middle){
        /// Codigo para
        explodir_parte(obj_boss_middle)
    }
    else if instance_exists(obj_boss_bottom){
        // Codigo para
        defeated_boss()
    }
}