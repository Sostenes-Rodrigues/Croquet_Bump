image_xscale = lerp(image_xscale, 0, 0.1)
image_yscale = lerp(image_yscale, 0, 0.1)
//hspeed = lerp(hspeed, 0, 0.1)
//vspeed = lerp(vspeed, 0, 0.1)
image_alpha = lerp(image_alpha, 0, 0.1)

if image_alpha <= 0.08{
    instance_destroy(id)
}