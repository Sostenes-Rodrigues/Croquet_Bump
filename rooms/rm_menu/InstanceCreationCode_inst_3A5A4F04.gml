minha_funcao = function()
{
    global.enable_tutorial = !global.enable_tutorial
    
    if global.enable_tutorial{
        cor1 = c_green
        cor2 = make_colour_rgb(0, 100, 0)
    }
    else {
    	cor1 = make_colour_rgb(230, 0, 0)
        cor2 = make_colour_rgb(140, 0, 0)
    }
}

//
if global.enable_tutorial{
    cor1 = c_green
    cor2 = make_colour_rgb(0, 100, 0)
}
else {
    cor1 = make_colour_rgb(230, 0, 0)
    cor2 = make_colour_rgb(140, 0, 0)
}

texto = "Tutorial"