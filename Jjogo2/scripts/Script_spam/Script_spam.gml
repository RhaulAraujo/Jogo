function src_spam_escolher_estado() {
    // Checa se o jogador está perto o suficiente para perseguir
    var distancia_jogador = point_distance(x, y, PersonagemObject1.x, PersonagemObject1.y); // distância até o jogador
    var prox_estad;
    
    if (distancia_jogador < 200) {  // 200 é a distância de ativação da perseguição (pode ajustar conforme necessário)
        prox_estad = "src_spam_perseguindo";  // Mudar para perseguir
    } else {
        prox_estad = choose("src_spam_andando", "src_spam_parado");  // Escolhe entre andando ou parado
    }

    if (prox_estad == "src_spam_andando") {
        estad = "src_spam_andando";  
        dest_x = irandom_range(10, room_width - 10);  // Evita que o destino esteja muito perto das bordas
        dest_y = irandom_range(0, room_height - 10);  // Evita que o destino esteja muito perto das bordas
    } else if (prox_estad == "src_spam_parado") {
        estad = "src_spam_parado";  
    } else if (prox_estad == "src_spam_perseguindo") {
        estad = "src_spam_perseguindo";  // Muda para o estado de perseguição
    }
}

function src_spam_andando() {
    image_speed = 0;  // Velocidade da imagem (animação)

    var _dir = point_direction(x, y, dest_x, dest_y);  // Direção para o destino
    var Horizon_veloc = lengthdir_x(Veloc, _dir);  // Velocidade horizontal
    var Verti_veloc = lengthdir_y(Veloc, _dir);  // Velocidade vertical

    x += Horizon_veloc;  // Atualiza a posição horizontal
    y += Verti_veloc;  // Atualiza a posição vertical

    // Verifica se o objeto chegou perto o suficiente do destino
    if (point_distance(x, y, dest_x, dest_y) < 5) {  
        // Se chegou ao destino, escolhe um novo destino
        src_spam_escolher_estado();
    }
}

function src_spam_perseguindo() {
    image_speed = 0;  // Sem animação durante a perseguição

    var _dir = point_direction(x, y, PersonagemObject1.x, PersonagemObject1.y);  // Direção para o jogador
    var Horizon_veloc = lengthdir_x(Veloc, _dir);  // Velocidade horizontal
    var Verti_veloc = lengthdir_y(Veloc, _dir);  // Velocidade vertical

    x += Horizon_veloc;  // Atualiza a posição horizontal em direção ao jogador
    y += Verti_veloc;  // Atualiza a posição vertical em direção ao jogador

    // Se a distância entre o inimigo e o jogador for grande o suficiente, mudar para o estado de "andando"
    var distancia_jogador = point_distance(x, y, PersonagemObject1.x, PersonagemObject1.y);
    if (distancia_jogador > 300) {  // Quando o inimigo ficar muito longe, ele volta ao estado de andar
        src_spam_escolher_estado();
    }
}

function src_spam_parado() {
    image_speed = 0.5;  // Apenas animação lenta enquanto parado
}

function atualizar_estado() {
    if (estad == "src_spam_andando") {
        src_spam_andando();  
    } else if (estad == "src_spam_parado") {
        src_spam_parado(); 
    } else if (estad == "src_spam_perseguindo") {
        src_spam_perseguindo();  // Chama a função de perseguição
    }
}
