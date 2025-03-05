<<<<<<< HEAD
draw_self();  // Desenha o sprite do objeto

// Desenhar a barra de progresso (em cima da tela quebrada)
var largura = sprite_width * progresso;
draw_set_color(c_white);
draw_rectangle(x - sprite_width / 2, y - sprite_height / 2, x - sprite_width / 2 + largura, y - sprite_height / 2 + 10, false);
=======
if (is_undefined(computador_pai)) {
	return;
}
var progresso_atual = computador_pai.progresso;
draw_sprite_part(barra_progresso, 0, 0, 0, sprite_width * (progresso_atual / progresso_maximo), sprite_height, x, y);
>>>>>>> ced6a07404d5cc72614f147ae7f35a19a7d88da2
