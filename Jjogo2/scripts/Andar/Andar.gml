function src_persona_andando(){

	Direita = keyboard_check(ord("D"));
Esquerda = keyboard_check(ord("A"));
Cima = keyboard_check(ord("W"));
Baixo = keyboard_check(ord("S"));

Horizon_Veloc = (Direita - Esquerda) * Veloc;

if place_meeting(x + Horizon_Veloc, y, ParedeObject2){
 while !place_meeting(x + sign(Horizon_Veloc), y, ParedeObject2){
  x += sign(Horizon_Veloc);
 }
 Horizon_Veloc = 0;
}

x += Horizon_Veloc;

Verti_Veloc = (Baixo - Cima) * Veloc;


if place_meeting(x, y + Verti_Veloc, ParedeObject2){
  while !place_meeting(x, y + sign(Verti_Veloc), ParedeObject2){
   y += sign(Verti_Veloc);
  }
  
  Verti_Veloc = 0;
}

y += Verti_Veloc;





// Variável para armazenar a última direção pressionada
if (keyboard_check(ord("D"))) {
    direcao = 0; // Direita
} 
else if (keyboard_check(ord("A"))) {
    direcao = 2; // Esquerda
}
else if (keyboard_check(ord("W"))) {
    direcao = 1; // Cima (Trás)
}
else if (keyboard_check(ord("S"))) {
    direcao = 3; // Baixo (Frente)
}

// Verifica se a velocidade é zero (sem movimento)
if (Horizon_Veloc == 0 && Verti_Veloc == 0) {
    // Atribui o sprite baseado na direção
    switch (direcao) {
        case 0:
            sprite_index = Personagem_Frente;
            break;
        case 1:
            sprite_index = Personagem_Tras;
            break;
        case 2:
            sprite_index = Personagem_Frente;
            break;
        case 3:
            sprite_index = Personagem_Frente;
            break;
        default:
            sprite_index = Personagem_Tras;
            break;
    }
} else {
    // Se estiver em movimento, ainda troca os sprites conforme a direção
    switch (direcao) {
        case 0:
            sprite_index = Personagem_Tras;
            break;
        case 1:
            sprite_index = Personagem_tras_correndo;
            break;
        case 2:
            sprite_index = Personagem_Frente;
            break;
        case 3:
            sprite_index = Personagem_Frente_Correndo;
            break;
        default:
            sprite_index = Personagem_Frente;
            break;
    }
}

if (x < 0) {
	x = 0;
}

//verifica se o personagem está sainda direita
if (x > room_width - sprite_width){
	x = room_width - sprite_width;
}

//verifica se o personagem está saindo pela parte superior da tela
if (y < 0) {
	y = 0;
}

//verifica se o personagem está saindo pela parte inferior da tela
if (y > room_height - sprite_height) {
	y = room_height - sprite_height;
}

}