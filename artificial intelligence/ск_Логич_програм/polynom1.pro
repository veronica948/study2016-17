class polynom
domains
rlist=real*
predicates
procedure new(rlist,integer)
procedure delete()
value(real,real)-(i,o)
value1(integer,rlist,real,real,real)-(i,i,i,o,i)

add(polynom,polynom)-(i,o)
addlist(rlist,rlist,rlist)-(i,i,o)

write_polynom()
append(rlist,rlist,rlist)- (i,i,o) (o,o,i) (o,[o|i],i)

endclass
implement polynom
facts - privateDB 
 pol(integer,rlist) 
clauses
new(L,N):-write("Степень полинома: ",N),nl,
          write("Коэффициенты полинома: ",L),nl,assert(pol(N,L)).
delete():-write("Работает деструктор"),nl,retractall(pol(_,_)).
value(X,R):-pol(N,L),value1(N,L,X,R,0.0).
value1(0,[H],X,R,S):-!,R=S*X+H.
value1(N,[H|T],X,R,S):-N1=N-1,S1=S*X+H,value1(N1,T,X,R,S1).
append([],L,L).
append([H|T],L,[H|T1]):-append(T,L,T1).
addlist([],L,L):-!.
addlist(L,[],L):-!.
addlist(L1,L2,L3):-append(N1,[E1],L1),append(N2,[E2],L2),E3=E1+E2,addlist(N1,N2,N3),append(N3,[E3],L3).
add(P,R):-pol(N,L),write(N),nl,P:pol(N1,L1),write(N1),nl,N>=N1,!,addlist(L,L1,L2),R=polynom::new(L2,N).
add(P,R):-pol(N,L),P:pol(N1,L1),addlist(L,L1,L2),R=polynom::new(L2,N1).

write_polynom():-pol(N,L),write("Степень полинома: ",N),nl,write("Коэффициенты: ",L),nl.
endclass
goal
P1=polynom::new([1.0,2.0,3.0,4.0],3),/*P1:append(L1,L2,[1.0,2.0,3.0]),*/P2=polynom::new([1.0,2.0,3.0],2),P1:value(1.0,R),
write("P1(1)=",R),nl,P2:write_polynom(),
P1:add(P2,R1),R1:write_polynom(),P1:delete(),P2:delete(),R1:delete().
         