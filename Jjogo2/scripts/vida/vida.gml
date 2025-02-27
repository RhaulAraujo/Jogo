function src_vida(){
	if global.vida < 1 {
	
	Veloc = 0;
	Horizon_Veloc = 0;
	Verti_Veloc = 0;
	
	instance_create_layer(0, 0, "Sequen", Obj_morte);
	//game_restart();	
}
}