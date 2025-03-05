if (progresso < 1) {
    progresso += velocidade;  // Aumentar o progresso
} else {
    // Quando o progresso atinge 100%
    instance_destroy();  // Apagar a barra de progresso
    // Mudar o sprite da tela quebrada para o sprite da tela consertada
    Obj_computador_quebrado.sprite_index = computador_consertado;
    Obj_computador_quebrado.animando = false;  // Finalizar a animação
}

