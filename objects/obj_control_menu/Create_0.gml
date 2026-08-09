/// Comecando a tocar a musica do jogo, caso nao estaja ja tocada
if !audio_is_playing(snd_music_game){
    audio_play_sound(snd_music_game, 0, true)
}