<<<<<<< HEAD
// Verificar proximidade do personagem
if (distance_to_object(PersonagemObject1) < 50 && !animando) {
    if (keyboard_check_pressed(ord("E"))) {
        // Iniciar animação de reparo
        animando = true;
        // Criar o objeto de barra de progresso
        instance_create_layer(x, y - 20, "Instances_1", Obj_barra_progresso);
    }
}
	
=======
if (consertando) {
	consertando = true;
	var barra = instance_create_layer(x, y - 32, "Instances", Obj_barra_progresso);
	barra.computador_pai = id;
	}
>>>>>>> ced6a07404d5cc72614f147ae7f35a19a7d88da2
