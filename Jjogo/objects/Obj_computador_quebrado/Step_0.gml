// Verificar proximidade do personagem
if (distance_to_object(PersonagemObject1) < 50 && !animando) {
    if (keyboard_check_pressed(ord("E"))) {
        // Iniciar animação de reparo
        animando = true;
        // Criar o objeto de barra de progresso
        instance_create_layer(x, y - 20, "Instances_1", Obj_barra_progresso);
    }
}
	