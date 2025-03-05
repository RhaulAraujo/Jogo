function src_persona_colissao(){
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

}



function src_persona_andando(){

	Direita = keyboard_check(ord("D"));
Esquerda = keyboard_check(ord("A"));
Cima = keyboard_check(ord("W"));
Baixo = keyboard_check(ord("S"));

Horizon_Veloc = (Direita - Esquerda) * Veloc;


	src_persona_colissao();


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
            sprite_index = Personagem_Direita;
            break;
        case 1:
            sprite_index = Personagem_Tras;
            break;
        case 2:
            sprite_index = Personagem_Esquerda;
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
            sprite_index = Personagem_Direita_Correndo;
            break;
        case 1:
            sprite_index = Personagem_tras_correndo;
            break;
        case 2:
            sprite_index = Personagem_Esquerda_Correndo;
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



	if(keyboard_check_pressed(ord("M"))){
		image_index = 0;
		estado = src_persona_ataque();
	}
	
	
	
	
	// Verificar se o personagem está perto da tela quebrada e pressionou "E"
if (distance_to_object(Obj_computador_quebrado) < 50) {
    if (keyboard_check_pressed(ord("E"))) {
        // Ação que ativa a animação de conserto da tela
        Obj_computador_quebrado.animando = true;
    }
}



}


function src_persona_ataque() {
 
    // Ajusta a posição da hitbox com base na direção
    var hitbox_offset_x = 0;
    var hitbox_offset_y = 0;

    switch (direcao) {
        case 0:  // Direita
            hitbox_offset_x = 35;  // Deslocamento para a direita
            break;
        case 1:  // Cima
            hitbox_offset_y = -35;  // Deslocamento para cima
            break;
        case 2:  // Esquerda
            hitbox_offset_x = -35;  // Deslocamento para a esquerda
            break;
        case 3:  // Baixo
            hitbox_offset_y = 35;  // Deslocamento para baixo
            break;
    }

    // Verifica se a hitbox não existe e cria a instância com o deslocamento adequado
    if (!instance_exists(Object_personagem_hitbox)) {
        instance_create_layer(x + hitbox_offset_x, y + hitbox_offset_y, "Instances", Object_personagem_hitbox);
        show_debug_message("Hitbox criada em direção " + string(direcao));
    }

    // Define o sprite da hitbox para o sprite de ataque
    sprite_index = Hitbox;

    // Verifica se a animação chegou ao último quadro
    if (image_index >= sprite_get_number(sprite_index) - 1) {
        // Destrói a hitbox se ela existir
        if (instance_exists(Object_personagem_hitbox)) {
            instance_destroy(Object_personagem_hitbox);
            show_debug_message("Hitbox destruída");
        }

        // Atualiza o estado para o estado de andar
        estado = src_persona_andando();

        // Reinicia o image_index para a animação de andar (voltar ao início)
        image_index = 0;

        // Permite um novo ataque após a animação ter terminado
        can_attack = true;
    }
}



