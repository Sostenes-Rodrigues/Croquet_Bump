// Se sai pela parte esquerda da camera
if (sprite_index != spr_enemies_normal) exit;

//
if (x + sprite_width / 2 < camera_get_view_x(view_camera[0])){
    // Me destruo
    instance_destroy(id, false)
    
    // Avisando que o jogador perdeu
    cria_transicao_inicia(rm_menu)
}