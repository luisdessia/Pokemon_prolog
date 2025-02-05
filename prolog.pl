% Fatos: Definem os Pokémons com ataque e defesa.
pokemon(agua, 10, 7).
pokemon(terrestre, 8, 9).
pokemon(pedra, 7, 10).
pokemon(fogo, 9, 6).
pokemon(eletrico, 10, 8).
pokemon(planta, 7, 9).

% Vantagens entre tipos de Pokémons.
vence(agua, fogo).
vence(agua, terrestre).
vence(fogo, planta).
vence(fogo, terrestre).
vence(planta, agua).
vence(eletrico, agua).

% Regras: Realiza a batalha e calcula o resultado.
batalha(Pokemon1, Pokemon2) :-
    pokemon(Pokemon1, Ataque1, Defesa1),
    pokemon(Pokemon2, Ataque2, Defesa2),
    (vence(Pokemon1, Pokemon2) -> Bonus1 is 2; Bonus1 is 0),
    (vence(Pokemon2, Pokemon1) -> Bonus2 is 2; Bonus2 is 0),
    
    Poder1 is Ataque1 + Bonus1 - Defesa2,
    Poder2 is Ataque2 + Bonus2 - Defesa1,

    (Poder1 > Poder2 -> Resultado = Pokemon1; 
     Poder2 > Poder1 -> Resultado = Pokemon2;
     Resultado = empate),

    format('~w (Poder: ~w) vs ~w (Poder: ~w): Resultado -> ~w~n', 
           [Pokemon1, Poder1, Pokemon2, Poder2, Resultado]).