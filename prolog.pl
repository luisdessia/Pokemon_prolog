% Fatos: Definem os Pokémons com ataque, defesa e exemplos de nomes.
pokemon(normal, 8, 7, 'Eevee').
pokemon(lutador, 10, 8, 'Machamp').
pokemon(venenoso, 9, 7, 'Gengar').
pokemon(terra, 8, 9, 'Sandslash').
pokemon(pedra, 7, 10, 'Onix').
pokemon(voador, 9, 8, 'Pidgeot').
pokemon(inseto, 8, 7, 'Scyther').
pokemon(fantasma, 9, 8, 'Gengar').
pokemon(aço, 10, 10, 'Steelix').
pokemon(fogo, 9, 6, 'Charizard').
pokemon(agua, 10, 7, 'Blastoise').
pokemon(planta, 7, 9, 'Venusaur').
pokemon(eletrico, 10, 8, 'Pikachu').
pokemon(psiquico, 10, 7, 'Alakazam').
pokemon(gelo, 9, 8, 'Lapras').
pokemon(dragao, 10, 9, 'Dragonite').
pokemon(sombrio, 9, 7, 'Umbreon').
pokemon(fada, 8, 9, 'Clefable').

% Vantagens e fraquezas baseadas na tabela.
vence(normal, nenhum). % Normal não tem vantagem
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
vence(aço, gelo).
vence(aço, pedra).
vence(fogo, planta).
vence(fogo, gelo).
vence(fogo, inseto).
vence(fogo, aço).
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

% Regras: Realiza a batalha e calcula o resultado.
batalha(Pokemon1, Pokemon2) :-
    pokemon(Pokemon1, Ataque1, Defesa1, Nome1),
    pokemon(Pokemon2, Ataque2, Defesa2, Nome2),
    (vence(Pokemon1, Pokemon2) -> Bonus1 is 2; Bonus1 is 0),
    (vence(Pokemon2, Pokemon1) -> Bonus2 is 2; Bonus2 is 0),
    
    Poder1 is Ataque1 + Bonus1 - Defesa2,
    Poder2 is Ataque2 + Bonus2 - Defesa1,

    (Poder1 > Poder2 -> Resultado = Nome1; 
     Poder2 > Poder1 -> Resultado = Nome2;
     Resultado = empate),

    format('~w (~w) [Poder: ~w] vs ~w (~w) [Poder: ~w]: Resultado -> ~w~n', 
           [Nome1, Pokemon1, Poder1, Nome2, Pokemon2, Poder2, Resultado]).
