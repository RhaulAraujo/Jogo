draw_self();  // Desenha o sprite do objeto

// Desenhar a barra de progresso (em cima da tela quebrada)
var largura = sprite_width * progresso;
draw_set_color(c_white);
draw_rectangle(x - sprite_width / 2, y - sprite_height / 2, x - sprite_width / 2 + largura, y - sprite_height / 2 + 10, false);
