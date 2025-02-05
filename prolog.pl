% Definição dos Pokémons com tipo, ataque e defesa
pokemon(eevee, normal, 8, 7).
pokemon(machamp, lutador, 10, 8).
pokemon(gengar, venenoso, 9, 7).
pokemon(sandslash, terra, 8, 9).
pokemon(onix, pedra, 7, 10).
pokemon(pidgeot, voador, 9, 8).
pokemon(scyther, inseto, 8, 7).
pokemon(gengar, fantasma, 9, 8).
pokemon(steelix, aco, 10, 10).
pokemon(charizard, fogo, 9, 6).
pokemon(blastoise, agua, 10, 7).
pokemon(venusaur, planta, 7, 9).
pokemon(pikachu, eletrico, 10, 8).
pokemon(alakazam, psiquico, 10, 7).
pokemon(lapras, gelo, 9, 8).
pokemon(dragonite, dragao, 10, 9).
pokemon(umbreon, sombrio, 9, 7).
pokemon(clefable, fada, 8, 9).

% Vantagens entre os tipos de Pokémon
vence(lutador, normal).
vence(lutador, pedra).
vence(lutador, gelo).
vence(lutador, sombrio).
vence(voador, lutador).
vence(voador, inseto).
vence(voador, planta).
vence(venenoso, planta).
vence(venenoso, fada).
vence(terra, venenoso).
vence(terra, pedra).
vence(terra, eletrico).
vence(pedra, fogo).
vence(pedra, gelo).
vence(pedra, voador).
vence(pedra, inseto).
vence(inseto, planta).
vence(inseto, psiquico).
vence(inseto, sombrio).
vence(fantasma, fantasma).
vence(fantasma, psiquico).
vence(aco, gelo).
vence(aco, pedra).
vence(fogo, planta).
vence(fogo, gelo).
vence(fogo, inseto).
vence(fogo, aco).
vence(agua, fogo).
vence(agua, terra).
vence(agua, pedra).
vence(planta, agua).
vence(planta, terra).
vence(planta, pedra).
vence(eletrico, agua).
vence(eletrico, voador).
vence(psiquico, lutador).
vence(psiquico, venenoso).
vence(gelo, planta).
vence(gelo, terra).
vence(gelo, dragao).
vence(gelo, voador).
vence(dragao, dragao).
vence(sombrio, psiquico).
vence(sombrio, fantasma).
vence(fada, dragao).
vence(fada, lutador).
vence(fada, sombrio).

% Regra para determinar o resultado de uma batalha
batalha(Pokemon1, Pokemon2) :-
    pokemon(Pokemon1, Tipo1, Ataque1, Defesa1),
    pokemon(Pokemon2, Tipo2, Ataque2, Defesa2),
    (vence(Tipo1, Tipo2) -> Bonus1 is 2; Bonus1 is 0),
    (vence(Tipo2, Tipo1) -> Bonus2 is 2; Bonus2 is 0),
    
    Poder1 is Ataque1 + Bonus1 - Defesa2,
    Poder2 is Ataque2 + Bonus2 - Defesa1,

    (Poder1 > Poder2 -> Resultado = Pokemon1; 
     Poder2 > Poder1 -> Resultado = Pokemon2;
     Resultado = empate),

    format('~w (~w) [Poder: ~w] vs ~w (~w) [Poder: ~w]: Resultado -> ~w~n', 
           [Pokemon1, Tipo1, Poder1, Pokemon2, Tipo2, Poder2, Resultado]).
