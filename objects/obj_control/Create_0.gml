#region Criacao dos inimigos
creation_fist_pos_x = 890
creation_fist_pos_y = 187

creation_sep_y = 60

creation_distance_max_x = camera_get_view_width(view_camera[0]) / 2


///Sempre terar ter rodadas rolando, ao a primeira da sequencia ser passada, cria outra, mantendo sempre 3
pos_x_fist_curret_round = 0
pos_x_third_curret_round = 0

//
round_max = 10


//
create_round = function(_x_start, _y_start){
    
}

/// Criando os primeiros round
for (var r = 0; r < 3; r++) {
    
	for (var e = 0; e < 4; e++) {
    	var _inst_enemy = instance_create_layer(creation_fist_pos_x, creation_fist_pos_y, "Enemies", obj_enemy_father)
        _inst_enemy.image_index = choose(IMAGE_INDEX_ENEMIES.DEMON, IMAGE_INDEX_ENEMIES.SHIELD, IMAGE_INDEX_ENEMIES.SLIME, IMAGE_INDEX_ENEMIES.FAIRY)
    }
}
#endregion