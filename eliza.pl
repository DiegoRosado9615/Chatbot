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
template([s([mi,nombre,es]),s(X)], [s([mi,nombre,es,eliza,mucho,gusto]),s(X)]).
template([s([yo,quiero,comprar,un]),s(X)], [s(['¿',seguro,quieres,un]),s(X),w('?')]).
template([s([yo,quiero,viajar,a]),s(X)], [s(['¿',seguro,quieres,ir,a]),s(X),w('?')]).
template([s([yo,quiero,comer,una]),s(X)], [s(['¿',qué,tan,sano,es,comer,una]),s(X),w('?')]).
template([s([me,siento]),s(X)], [s(['¿',por,qué,te,sientes]),s(X),w('?')]).
template([s([me,gusta,bailar]),s(X)], [s(['¿',en,serio,'?',a,mí,me,encanta,bailar]),s(X)]).
template([s([te,gustan,los]),s(X)], [s([lo,siento,no,me,gustan]),s(X)]).
template([s([has,visto]),s(X)], [s([sí,me,encanta,ver]),s(X)]).
template([s([sabes,cocinar]),s(X)], [s([soy,una,máquina,no,puedo,cocinar]),s(X)]).
template([s([te,has,enfermado,de]),s(X)], [s([soy,una,máquina,y,no,puedo,enfermarme,de]),s(X)]).
template([s([mi,serie,favorita,es]),s(X)], [s(['¡',mi,serie,favorita,también,es]),s(X),w('!')]).


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
