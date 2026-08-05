// Switch debug, precisa do macro de debug para poder ser mudado
global.debug = false


// Instance to follow
global.selected_entity = noone


// Forca do disparo
global.force_shoot = 40
// Atrito que para os objetos jogados
global.force_friction = 0.98

// Tempo para carregar o poder de atirar
global.time_charge_power = 1 * FPS_GAME


// Variacao do angulo usado na mira do tiro
global.variation_ang = 45
// Velocidade que essa variacao muda
global.variation_ang_spd = 1.2


/// Variaveis da forca do screenshaked dependendo do tipo de acao
global.screenshake_shoot = 15
global.screenshake_hit = 10
global.screenshake_power = 12