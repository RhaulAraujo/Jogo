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

direcao = floor((point_direction(x, y, mouse_x, mouse_y) + 45)/90);


if Horizon_Veloc == 0 and Verti_Veloc == 0{
switch direcao{
	
	default:
		sprite_index = Sprite_Perso_Direita;
	break;
	
	case 1:
		sprite_index = Sprite_Perso_Cima;
	break;
	
	case 2:
		sprite_index = Sprite_Perso_Esquerda;
	break;
	
	case 3:
		sprite_index = Sprite_Perso_Baixo;
	break;
}
}else{
	
	switch direcao{	
	default:
		sprite_index = Sprite_Perso_Direita;
	break;
	
	case 1:
		sprite_index = Sprite_Perso_Cima;
	break;
	
	case 2:
		sprite_index = Sprite_Perso_Esquerda;
	break;
	
	case 3:
		sprite_index = Sprite_Perso_Baixo;
	break;
}
}
/*if dir == 0{
	sprite_index = Sprite5;
}else if dir == 1{

}else if dir == 2{

}else if dir == 3{

}*/

