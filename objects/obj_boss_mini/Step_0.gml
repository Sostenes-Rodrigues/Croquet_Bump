if !cai{
    vspeed = clamp(vspeed + 0.2, -7, 12)
    image_angle += 2
    
    if y > ystart{
        cai = true
        
        hspeed = 0
        vspeed = 0
        
        alarm[0] = 2 * FPS_GAME
    }
}