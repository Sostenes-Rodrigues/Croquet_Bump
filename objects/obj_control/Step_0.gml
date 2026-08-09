/// Criando novos inimigos
if instance_exists(obj_selected_entity){
    // Se ainda tem rounds para serem criados
    if (round_current <= round_max){
        // Se o jogador passou do ante-penultimo ponto de criacao
        if (obj_selected_entity.x > array_first(array_last3_pos_x_round)){
            // Aumentando o contador de rounds
            round_current ++
            
            // Criando a nova fileira de inimigos
            create_round(creation_pos_x, creation_fist_pos_y, "walk")
            
            // Pegando a proxima posicao de criacao dos inimigos
            creation_pos_x += creation_sep_round_x_max * random_range(0.9, 1)
            // Colocando essa nova posicao no final da lista
            array_push(array_last3_pos_x_round, creation_pos_x)
            // Deletando o primeiro elemento da lista
            array_delete(array_last3_pos_x_round, 0, 1)
        }
    }
    // Se acabou os rounds, hora do chefe
    else {
    	if !boss_create{
            boss_create = true
            
            // Pegando a proxima posicao de criacao dos inimigos
            creation_pos_x += creation_sep_round_x_max * random_range(0.8, 1)
            
            // Crio o obj boss
            show_message("Boss criado")
        }
    }
}

/// Reiniciando a fase
//if (keyboard_check_pressed(ord("R"))) cria_transicao_inicia(room);


/// Debug
if TARGET_DEBUG{
    if keyboard_check_pressed(vk_f3){
        global.debug = !global.debug
    }
    
    if global.debug{
        // Reiniciando o jogo
        if (keyboard_check_pressed(ord("R"))) game_restart();
    }
}