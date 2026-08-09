minha_funcao = function()
{
    window_set_fullscreen(!window_get_fullscreen())
    
    if window_get_fullscreen(){
        cor1 = c_green
        cor2 = make_colour_rgb(0, 100, 0)
    }
    else {
    	cor1 = make_colour_rgb(230, 0, 0)
        cor2 = make_colour_rgb(140, 0, 0)
    }
}

//
if window_get_fullscreen(){
    cor1 = c_green
    cor2 = make_colour_rgb(0, 100, 0)
}
else {
    cor1 = make_colour_rgb(230, 0, 0)
    cor2 = make_colour_rgb(140, 0, 0)
}

texto = "Tela Cheia"