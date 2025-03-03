Direita = -1;
Esquerda = -1;
Cima = -1;
Baixo = -1;

Horizon_Veloc = 0;
Verti_Veloc = 0;

Veloc = 2;

direcao = 0;

global.vida = 2;

global.morreu = false; 

estado = src_persona_andando;


// Create Event do obj_personagem
frame_counter = 0;  // Inicializa o contador de quadros
can_attack = true;  // Inicializa a variável de controle do ataque

dano = 1;