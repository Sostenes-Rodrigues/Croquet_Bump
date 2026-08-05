// Se o jogador passou do ultimo ponto de criacao



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