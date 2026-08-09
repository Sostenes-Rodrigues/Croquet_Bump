/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self();

draw_set_font(global.font_paper);
draw_set_halign(fa_center);
draw_set_valign(fa_middle)
draw_text_transformed(x, y - sprite_height * 0.17, texto, escala_txt * 0.6, escala_txt * 0.6, image_angle);
draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);
