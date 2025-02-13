Direita = keyboard_check(ord("D"));
Esquerda = keyboard_check(ord("A"));
Cima = keyboard_check(ord("W"));
Baixo = keyboard_check(ord("S"));

Horizon_Veloc = (Direita - Esquerda) * Veloc;

x += Horizon_Veloc;

Verti_Veloc = (Baixo - Cima) * Veloc;

y += Verti_Veloc;