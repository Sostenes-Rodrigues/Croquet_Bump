#region Criacao dos inimigos
/// Posicao de criacao do primeiro inimigo
creation_fist_pos_x = 890
creation_fist_pos_y = 187

// Posicao horizontal de criacao atual
creation_pos_x = creation_fist_pos_x

// Distancial vertical entre os inimigos de uma onda
creation_sep_y = 180
// Maxima distancia horizontal entre os rounds
creation_sep_round_x_max = camera_get_view_width(view_camera[0]) / 1.4


///Sempre terar ter rodadas rolando, ao a primeira da sequencia ser passada, cria outra, mantendo sempre 3
array_last3_pos_x_round = []

// Numero de rounds ate o boss
round_max = 5

// Round atual
round_current = 0

// Variavel de controle para saber se o boss ja foi criado
boss_create = false


// Metodo para criar uma fileira de inimigos
create_round = function(_x_start, _y_start, _state_txt, _att_boss=false){
    //
    static __array_boss_attack = [1, 0, 0, 0]
    //
    __array_boss_attack = array_shuffle(__array_boss_attack)
    
    // Cria 4 inimigos
    for (var e = 0; e < 4; e++) {
        // Posicao vertical de cada inimigo
        var _yy = _y_start + (e * creation_sep_y)
        
        // Criando a instancia do inimigo
    	var _inst_enemy = instance_create_layer(_x_start, _yy, "Enemies", obj_enemy_father)
        ///
        if _att_boss{
            _inst_enemy.sprite_index = spr_boss_attack
            _inst_enemy.image_index = __array_boss_attack[e]
            
        }
        else {
        	// Passando um tipo de inimigo aleatoriamente
            _inst_enemy.image_index = choose(IMAGE_INDEX_ENEMIES.DEMON, IMAGE_INDEX_ENEMIES.SHIELD, IMAGE_INDEX_ENEMIES.SLIME, IMAGE_INDEX_ENEMIES.FAIRY)
        }
        
        /// Se e para comecar no estado de andando
        if (_state_txt == "walk"){
            _inst_enemy.state = _inst_enemy.state_walk
        }
    }
}

/// Criando os primeiros 3 rounds
for (var r = 0; r < 3; r++) {
    // Aumentando o contador de rounds
    round_current ++
    
    // Criando a fileira de inimigos
	create_round(creation_pos_x, creation_fist_pos_y, "idle")
    
    creation_pos_x += creation_sep_round_x_max * random_range(0.9, 1) //// ERROR
    array_push(array_last3_pos_x_round, creation_pos_x)
}


#endregion