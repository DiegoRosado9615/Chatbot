%%  eliza(+Stimuli, -Response) is det.
%   @param  Stimuli is a list of atoms (words).
%   @author Richard A. O'Keefe (The Craft of Prolog)

eliza(Stimuli, Response) :-
    template(InternalStimuli, InternalResponse),
    match(InternalStimuli, Stimuli),
    match(InternalResponse, Response),
    !.

template([s([i,am]),s(X)], [s([why,are,you]),s(X),w('?')]).
template([w(i),s(X),w(you)], [s([why,do,you]),s(X),w(me),w('?')]).
%%Suguerencias de diego
%template([s([why,am,i]),s(X)], [s([you,are,cool,for,me])]).
template([s([yo,quiero,comprar,un]),s(X)], [s([ seguro, quieres,un]),s(X),w('?')]).
template([s([yo,quiero,viajar,a]),s(X)], [s([ seguro, quieres,ir, a ]),s(X),w('?')]).
template([s([yo,quiero,comer,una]),s(X)], [s([ que, tan, sano ,es ,comer,una ]),s(X),w('?')]).
template([s([me,siento]),s(X)], [s([ '¿',por, qué, te, sientes  ]),s(X),w('?')]).
template([s([me, gusta , bailar ]),s(X)], [s([encerio,a , mi , me, ecanta, bailar   ]),s(X),w('?')]).
template([s([te, gustan,los  ]),s(X)], [s([no, lo, siento, no,me,gustan  ]),s(X)]).
template([s([has,visto  ]),s(X)], [s([si,me, encanta, ver  ]),s(X)]).
template([s([conoces, a  ]),s(X)], [s([no, conosco,a  ]),s(X)]).
template([s([te,has,enfermado,de  ]),s(X)], [s([soy,una,maquina, y ,no,puedo ,enfermarmem, de ]),s(X)]).

%%Mis suguerencias


match([],[]).
match([Item|Items],[Word|Words]) :-
    match(Item, Items, Word, Words).

match(w(Word), Items, Word, Words) :-
    match(Items, Words).
match(s([Word|Seg]), Items, Word, Words0) :-
    append(Seg, Words1, Words0),
    match(Items, Words1).


/** <examples>

?- eliza([i, am, very, hungry], Response).
?- eliza([i, love, you], Response).

*/
