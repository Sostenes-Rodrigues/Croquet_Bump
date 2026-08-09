// Explosao (Mudar depois)
var _inst_effect = instance_create_depth(x, y, depth - 1, obj_effect_destroy_self)
//_inst_effect.sprite_index = spr_charge_power

// Som da explosao
audio_play_sound(snd_sfx_explo, 0, false)