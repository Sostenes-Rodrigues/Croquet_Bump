/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _mouse_sobre = position_meeting(mouse_x, mouse_y, id);
var _mouse_click = mouse_check_button_pressed(mb_left);



if (_mouse_sobre)
{
    if sound_above{
        sound_above = false
        
        audio_play_sound(snd_sfx_above, 5, false)
    }
    
    tween(id, "image_xscale", xscale * 1.1, tween_animation.elastic_out, 60);
    tween(id, "image_yscale", yscale * 1.1, tween_animation.elastic_out, 60);
    tween(id, "escala_txt", 1.1, tween_animation.elastic_out, 60);
    tween(id, "val_cor", 1, tween_animation.elastic_out, 60);
    
    if (_mouse_click)
    {
        if !active_button{
            active_button = force_one_active
            
            audio_play_sound(snd_sfx_click, 5, false)
            
            tween(id, "image_xscale", xscale * 5, tween_animation.back, 20);
            tween(id, "image_yscale", yscale * 2, tween_animation.back, 20);
            tween(id, "escala_txt", 5, tween_animation.back, 20);
            
            minha_funcao();
        }
    }
}
else
{
    sound_above = true
    
    tween(id, "image_xscale", xscale, tween_animation.back, 20);
    tween(id, "image_yscale", yscale, tween_animation.back, 20);
    tween(id, "escala_txt", 1, tween_animation.back, 20);
    tween(id, "val_cor", 0, tween_animation.back, 20);
}

image_blend = merge_colour(cor1, cor2, val_cor);