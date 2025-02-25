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
            sprite_index = Personagem_1_Doireita_1;
            break;
        case 1:
            sprite_index = Personagem_1_Tras_1;
            break;
        case 2:
            sprite_index = Personagem_1_Esquerda_4;
            break;
        case 3:
            sprite_index = Personagem_1_Frente_1;
            break;
        default:
            sprite_index = Personagem_1_Doireita_1;
            break;
    }
} else {
    // Se estiver em movimento, ainda troca os sprites conforme a direção
    switch (direcao) {
        case 0:
            sprite_index = Personagem_1_Doireita_1;
            break;
        case 1:
            sprite_index = Personagem_1_Tras_1;
            break;
        case 2:
            sprite_index = Personagem_1_Esquerda_Correndo_4;
            break;
        case 3:
            sprite_index = Personagem_1_Frente_1;
            break;
        default:
            sprite_index = Personagem_1_Doireita_1;
            break;
    }
}



//verifica se o personagem está saindo pela esquerda
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






/*direcao = floor((point_direction(x, y, mouse_x, mouse_y) + 45)/90);


if Horizon_Veloc == 0 and Verti_Veloc == 0{
switch direcao{
	
	default:
		sprite_index = Personagem_1_Doireita_1;
	break;
	
	case 1:
		sprite_index = Personagem_1_Tras_1;
	break;
	
	case 2:
		sprite_index = Personagem_1_Esquerda_4;
	break;
	
	case 3:
		sprite_index = Personagem_1_Frente_1;
	break;
}
}else{
	
	switch direcao{	
	default:
		sprite_index = Personagem_1_Doireita_1;
	break;
	
	case 1:
		sprite_index = Personagem_1_Tras_1;
	break;
	
	case 2:
		sprite_index = Personagem_1_Esquerda_4;
	break;
	
	case 3:
		sprite_index = Personagem_1_Frente_1;
	break;
}
}
/*if dir == 0{
	sprite_index = Sprite5;
}else if dir == 1{

}else if dir == 2{

}else if dir == 3{

}*/


	

	


if global.vida < 1 {
	
	Veloc = 0;
	Horizon_Veloc = 0;
	Verti_Veloc = 0;
	
	instance_create_layer(0, 0, "Sequen", Obj_morte);
	//game_restart();	
}
