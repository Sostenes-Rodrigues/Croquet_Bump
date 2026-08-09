image_blend = c_purple
image_alpha = 0.7
image_xscale = 0.8
image_yscale = 0.8


end_animation = function(){
    instance_destroy(id)
}

tween(id, "image_xscale", 0, tween_animation.bounce_inout, 20, end_animation)
tween(id, "image_yscale", 0, tween_animation.bounce_inout, 20, end_animation)
tween(id, "image_alpha", 0, tween_animation.bounce_inout, 20, end_animation)