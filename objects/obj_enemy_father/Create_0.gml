// Inherit the parent event
event_inherited();


// Acrecentando o estado que eles andam ate o player
state_walk = function(){
    // If is the fist time in this state
    if (state_txt != state_txt_struct_strings.walk){
        state_txt = state_txt_struct_strings.walk
        
        // Walk to player
        hspeed = -1
    }
    
    /// Effect Stretch and Squash to walk
    tween(id, "image_xscale", xscale_destiny, my_tween_animation, time_effect_stretch_squash, effect_stretch_squash)
    tween(id, "image_yscale", yscale_destiny, my_tween_animation, time_effect_stretch_squash)
}

// Acrecentando o nome do novo estado na struct dos nomes
struct_set(state_txt_struct_strings, "walk", "walk")