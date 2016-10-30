domains
ilist=integer*

predicates
sum(ilist,ilist,ilist)
sum1(ilist,ilist,ilist,integer,integer,ilist,ilist)
digitsum(integer,integer,integer,integer,integer,ilist,ilist)
del_var(integer,ilist,ilist)
% vubor znachenija dla peremennoj cifry esli ona ne svazana
clauses
sum(N1,N2,N):- % chisla predstavlennue kak spiski zifr
sum1(N1,N2,N,0,0, % obe cyfry perenosa vpravo i vlevo =0
[0,1,2,3,4,5,6,7,8,9],_). % vse dostupnue cifry
sum1([],[],[],C,C,Digits,Digits).
sum1([D1|N1],[D2|N2],[D|N],C1,C,Digs1,Digs):-
sum1(N1,N2,N,C1,C2,Digs1,Digs2),
digitsum(D1,D2,C2,D,C,Digs2,Digs).

digitsum(D1,D2,C1,D,C,Digs1,Digs):-
del_var(D1,Digs1,Digs2), % vubiraem dostupnuju cifry D1
del_var(D2,Digs2,Digs3), % vubiraem dostupnuju cifry D2
del_var(D,Digs3,Digs),   % vubrat   dostupnuju dla D
S=D1+D2+C1,
D= S mod 10, %ostatok
C= S div 10. %celochislennue delenija
del_var(A,L,L):- bound(A),!. %peremennaja A uje svazana
del_var(A,[A|L],L). %vzat znachenije A iz golovu spiska
del_var(A,[B|L],[B|L1]):- del_var(A,L,L1). %vzat znachenije A iz xvosta spiska
goal
sum ([D,O,N,A,L,D],[G,E,R,A,L,D],[R,O,B,E,R,T]).