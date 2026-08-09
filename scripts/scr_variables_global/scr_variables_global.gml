// Switch debug, precisa do macro de debug para poder ser mudado
global.debug = false


// Instance to follow
global.selected_entity = noone


// Forca do disparo
global.force_shoot = 35
// Atrito que para os objetos jogados
global.force_friction = 0.975

// Tempo para carregar o poder de atirar
global.time_charge_power = 0.35 * FPS_GAME


// Variacao do angulo usado na mira do tiro
global.variation_ang = 45
// Velocidade que essa variacao muda
global.variation_ang_spd = 1.2


/// Variaveis da forca do screenshaked dependendo do tipo de acao
global.screenshake_shoot = 20
global.screenshake_hit = 14
global.screenshake_power = 16

//
global.enable_tutorial = true


//
global.font_paper = font_add("GreenPiloww-0Kwr.ttf", 100, true, true, 32, 128);