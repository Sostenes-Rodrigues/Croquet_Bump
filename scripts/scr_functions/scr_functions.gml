/// Local de criação das funções


// Screenshake
function screenshake(_shake) {
	var _screenshake = instance_create_layer(0, 0, layer, obj_screenshake)
	_screenshake.shake = _shake
}


// Draw circular bar
function draw_circular_bar(_x ,_y ,_value, _max, _colour, _radios, _transparency, _width, _starting_angle, _direction){
    if (_value > 0) {
        var i, len, tx, ty, val;
        
        var numberofsections = 60;
        var sizeofsection = 360 / numberofsections;
        
        val = (_value / _max) * numberofsections;
        
        if (val > 1) {
            var piesurface = surface_create(_radios * 2, _radios * 2);
            
            draw_set_colour(_colour);
            draw_set_alpha(_transparency);
            
            surface_set_target(piesurface);
            
            draw_clear_alpha(c_black, 0);
            
            draw_primitive_begin(pr_trianglefan);
            draw_vertex(_radios, _radios);
            
            for (i = 0; i <= val; i++)
            {
                len = _starting_angle + (i * sizeofsection * _direction);
                
                tx = lengthdir_x(_radios, len);
                ty = lengthdir_y(_radios, len);
                
                draw_vertex(_radios + tx, _radios + ty);
            }
            
            draw_primitive_end();
            
            draw_set_alpha(1);
            
            gpu_set_blendmode(bm_subtract);
            draw_set_colour(c_black);
            draw_circle(_radios - 1, _radios - 1, _radios - _width, false);
            gpu_set_blendmode(bm_normal);
            
            surface_reset_target();
            
            draw_surface(piesurface, _x - _radios, _y - _radios);
            
            surface_free(piesurface);
        }
    }
}


//
function Loading_sight(_ang, _ang_start, _x_ori, _y_ori){
    static __increase = global.variation_ang_spd
    
    var _rad = 200
    var _ang_max = _ang_start + global.variation_ang
    var _ang_min = _ang_start - global.variation_ang
    
    //
    _ang = clamp(_ang + __increase, _ang_start - global.variation_ang, _ang_start + global.variation_ang)
    
    if (_ang >= _ang_max or _ang <= _ang_min){
        __increase *= -1
    }
    
    ///
    draw_circular_bar(_x_ori, _y_ori, global.variation_ang * 2, 360, c_black, _rad / 4, 1, 5, _ang_start - global.variation_ang, 1)
    
    
    /// Linha do angulo maximo
    var _x2_max = _x_ori + lengthdir_x(_rad, _ang_start + global.variation_ang)
    var _y2_max = _y_ori + lengthdir_y(_rad, _ang_start + global.variation_ang)
    draw_line_width_colour(_x_ori, _y_ori, _x2_max, _y2_max, 5, c_purple, c_purple)
    
    /// Linha do angulo minimo
    var _x2_min = _x_ori + lengthdir_x(_rad, _ang_start - global.variation_ang)
    var _y2_min = _y_ori + lengthdir_y(_rad, _ang_start - global.variation_ang)
    draw_line_width_colour(_x_ori, _y_ori, _x2_min, _y2_min, 5, c_purple, c_purple)
    
    /// Linha que segue o angulo atual
    var _x2 = _x_ori + lengthdir_x(_rad, _ang)
    var _y2 = _y_ori + lengthdir_y(_rad, _ang)
    draw_line_width_colour(_x_ori, _y_ori, _x2, _y2, 5, c_black, c_black)
    
    // Return ang
    return (_ang)
}