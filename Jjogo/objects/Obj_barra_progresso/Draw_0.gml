if (is_undefined(computador_pai)) {
	return;
}
var progresso_atual = computador_pai.progresso;
draw_sprite_part(barra_progresso, 0, 0, 0, sprite_width * (progresso_atual / progresso_maximo), sprite_height, x, y);
